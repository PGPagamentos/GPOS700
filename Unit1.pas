unit Unit1;

interface

uses

  InterfaceAutomacao_v1_6_0_0,

  Unit2,

  GEDIPrinter,    //Esta unit inicializa o Modulo de impressao G700.
  G700Interface,

  Androidapi.JNI.JavaTypes,
  Androidapi.Helpers,
  Androidapi.Log,

  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,

  FMX.Platform.Android,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.Edit,
  FMX.Objects,
  FMX.ListBox,
  FMX.DialogService,

  Androidapi.JNIBridge,
  Androidapi.JNI.App,
  Androidapi.Jni.GraphicsContentViewText,
  Androidapi.JNI.Util,
  Androidapi.Jni.OS;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Layout1: TLayout;
    Label2: TLabel;
    editValor: TEdit;
    GroupBox2: TGroupBox;
    rbEstabelecimento: TRadioButton;
    rbEmissor: TRadioButton;
    rbAVista: TRadioButton;
    rbParcelamentoNaoDef: TRadioButton;
    Label3: TLabel;
    Label4: TLabel;
    editParcelas: TEdit;
    cbAdquirente: TComboBox;
    cbConfManual: TCheckBox;
    cbViasDif: TCheckBox;
    cbViaReduz: TCheckBox;
    cbInterfaceAlternativa: TCheckBox;
    btnPagar: TButton;
    btnCancelamento: TButton;
    btnAdministrativo: TButton;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    ListBoxItem8: TListBoxItem;
    ListBoxItem9: TListBoxItem;
    ListBoxItem10: TListBoxItem;
    ListBoxItem11: TListBoxItem;
    ListBoxItem12: TListBoxItem;
    ListBoxItem13: TListBoxItem;
    ListBoxItem14: TListBoxItem;
    ListBoxItem15: TListBoxItem;
    ListBoxItem16: TListBoxItem;
    ListBoxItem17: TListBoxItem;
    ListBoxItem18: TListBoxItem;
    ListBoxItem19: TListBoxItem;
    ListBoxItem20: TListBoxItem;
    ListBoxItem21: TListBoxItem;
    ListBoxItem22: TListBoxItem;
    GroupBox1: TGroupBox;
    cbNaoDefinido: TCheckBox;
    cbCredito: TCheckBox;
    cbDebito: TCheckBox;
    cbVoucher: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
    procedure btnCancelamentoClick(Sender: TObject);
    procedure btnAdministrativoClick(Sender: TObject);
    procedure cbNaoDefinidoChange(Sender: TObject);
    procedure cbCreditoChange(Sender: TObject);
    procedure cbDebitoChange(Sender: TObject);
    procedure cbVoucherChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    mensagemErro : string;

    nsu, codigoAutorizacao, valorOperacao : string;

    GediPrint : TGEDIPrinter;

    procedure setTexLisBox;
    procedure iniPayGoInterface(mudacor : Boolean; ViaDeferenciada : Boolean; ViaReduzida: Boolean);
    procedure efetuaOperacao(operacoes : JOperacoes);

    procedure LogAplicacao(msg: String);
    procedure traduzResultadoOperacao;

    procedure ConfirmaOperacao;
    procedure ImpressaoComprovantes(titulo, cupom : string);
    procedure trataComprovante;
    procedure existeTransacaoPendente;

    procedure mensagemFim(mensagem : string);

    function resultadoOperacacao : JRunnable;
    function setPersonalizacao(mudacor: Boolean): JPersonalizacao;
    function trataMensagemResultado : string;

  end;

var
  mHandler          : JHandler;
  mConfimacoes      : JConfirmacoes;
  mDadosAutomacao   : JDadosAutomacao;
  mPersonalizacao   : JPersonalizacao;
  mTransacoes       : JTransacoes;
  mSaidaTransacao   : JSaidaTransacao;
  mEntradaTransacao : JEntradaTransacao;
  mViasImpressao    : JViasImpressao;
  Form1             : TForm1;

implementation

{$R *.fmx}

// **********************************************
procedure TForm1.LogAplicacao(msg: String);
var
  M: TMarshaller;
begin
  LOGW(M.AsUtf8(msg).ToPointer);
end;
// **********************************************

// **********************************************
procedure TForm1.FormCreate(Sender: TObject);
begin
  iniPayGoInterface(false, false, false);
  setTexLisBox;
  mHandler := TJHandler.Create
  // dateFormat := TJDate
end;
// **********************************************

// **********************************************
procedure TForm1.setTexLisBox;
begin
  ListBoxItem1.Text  := 'PROVEDOR DESCONHECIDO';
  ListBoxItem2.Text  := 'LIBERCARD';
  ListBoxItem3.Text  := 'ELAVON';
  ListBoxItem4.Text  := 'CIELO';
  ListBoxItem5.Text  := 'RV';
  ListBoxItem6.Text  := 'BIN';
  ListBoxItem7.Text  := 'FDCORBAN';
  ListBoxItem8.Text  := 'REDE';
  ListBoxItem9.Text  := 'INFOCARDS';
  ListBoxItem10.Text := 'CREDSYSTEM';
  ListBoxItem11.Text := 'NDDCARD';
  ListBoxItem12.Text := 'VERO';
  ListBoxItem13.Text := 'GLOBAL';
  ListBoxItem14.Text := 'GAX';
  ListBoxItem15.Text := 'STONE';
  ListBoxItem16.Text := 'DMCARD';
  ListBoxItem17.Text := 'CTF';
  ListBoxItem18.Text := 'TICKETLOG';
  ListBoxItem19.Text := 'GETNET';
  ListBoxItem20.Text := 'VCMAIS';
  ListBoxItem21.Text := 'SAFRA';
  ListBoxItem22.Text := 'PAGSEGURO';
  ListBoxItem22.Text := 'CONDUCTOR';
end;
// **********************************************

// **********************************************
procedure TForm1.iniPayGoInterface(mudacor : Boolean; ViaDeferenciada : Boolean; ViaReduzida: Boolean);
var
  versao : JString;
begin

  versao := MainActivity.getPackageManager.getPackageInfo(MainActivity.getPackageName, 0).versionName;

  mPersonalizacao := setPersonalizacao(mudacor);

  mDadosAutomacao := TJDadosAutomacao.JavaClass.init(
                                         StringToJString('Gertec'),             // Empresa Automação
                                         StringToJString('Automação Demo'),     // Nome Automação
                                         versao,                                // Versão
                                         true,                                  // Suporta Troco
                                         true,                                  // Suporta Desconto
                                         ViaDeferenciada,                       // Via Diferenciada
                                         ViaReduzida,                           // Via Reduzida
                                         mPersonalizacao);                      // Personaliza Tela

  mTransacoes := TJTransacoes.JavaClass.obtemInstancia(mDadosAutomacao, MainActivity);

end;
// **********************************************

// **********************************************
function TForm1.setPersonalizacao(mudacor : Boolean): JPersonalizacao;
var
  pb : JPersonalizacao_Builder;
begin

  pb := TJPersonalizacao_Builder.Create;

  if mudacor then
  begin
    pb.informaCorFonte(StringToJString('#000000'));
    pb.informaCorFonteTeclado(StringToJString('#000000'));
    pb.informaCorFundoCaixaEdicao(StringToJString('#FFFFFF'));
    pb.informaCorFundoTela(StringToJString('#F4F4F4'));
    pb.informaCorFundoTeclado(StringToJString('#F4F4F4'));
    pb.informaCorFundoToolbar(StringToJString('#2F67F4'));
    pb.informaCorTextoCaixaEdicao(StringToJString('#000000'));
    pb.informaCorTeclaPressionadaTeclado(StringToJString('#e1e1e1'));
    pb.informaCorTeclaLiberadaTeclado(StringToJString('#dedede'));
    pb.informaCorSeparadorMenu(StringToJString('#2F67F4'));

  end;

  result := pb.build;

end;
// **********************************************

// **********************************************
procedure TForm1.btnAdministrativoClick(Sender: TObject);
begin
  efetuaOperacao(TJOperacoes.JavaClass.ADMINISTRATIVA);
end;
// **********************************************

// **********************************************
procedure TForm1.btnCancelamentoClick(Sender: TObject);
begin
  // Form2.Show
end;
// **********************************************

// **********************************************
procedure TForm1.btnPagarClick(Sender: TObject);
begin
  efetuaOperacao(TJOperacoes.JavaClass.VENDA);
end;
// **********************************************

// **********************************************
procedure TForm1.cbCreditoChange(Sender: TObject);
begin
  if cbCredito.IsChecked then
    begin
      editParcelas.Enabled    := True;
      cbNaoDefinido.IsChecked := False;
      cbDebito.IsChecked      := False;
      cbVoucher.IsChecked     := False;
    end;

end;
// **********************************************

// **********************************************
procedure TForm1.cbDebitoChange(Sender: TObject);
begin
  if cbDebito.IsChecked then
    begin
      editParcelas.Enabled    := False;
      cbNaoDefinido.IsChecked := False;
      cbCredito.IsChecked     := False;
      cbVoucher.IsChecked     := False;
    end;
end;
// **********************************************

// **********************************************
procedure TForm1.cbNaoDefinidoChange(Sender: TObject);
begin
  if cbNaoDefinido.IsChecked then
    begin
      editParcelas.Enabled := False;
      cbCredito.IsChecked  := False;
      cbDebito.IsChecked   := False;
      cbVoucher.IsChecked  := False;
    end;

end;
// **********************************************

// **********************************************
procedure TForm1.cbVoucherChange(Sender: TObject);
begin
  if cbVoucher.IsChecked then
    begin
      editParcelas.Enabled := False;
      cbNaoDefinido.IsChecked := False;
      cbCredito.IsChecked := False;
      cbDebito.IsChecked := False;
    end;
end;
// **********************************************

// **********************************************
procedure TForm1.efetuaOperacao(operacoes : JOperacoes);
var
  NumeroOperacao : integer;
begin
  // OK
  tthread.CreateAnonymousThread(
    procedure
    begin

      NumeroOperacao := Round(random(99999)); // 99999 é o limite do numero randomico

      iniPayGoInterface(cbInterfaceAlternativa.IsChecked, cbViasDif.IsChecked, cbViaReduz.IsChecked);

      mEntradaTransacao := TJEntradaTransacao.JavaClass.init(operacoes, StringToJString(IntToStr(NumeroOperacao)));

      // Start da operação

      // Se for venda informa o número da operação
      if operacoes = TJOperacoes.JavaClass.VENDA then
        mEntradaTransacao.informaDocumentoFiscal(StringToJString(IntToStr(NumeroOperacao)));

      // Valor Total da Operação
      mEntradaTransacao.informaValorTotal(StringToJString(editValor.Text.Replace(',', '').Replace('.','')));

      // Case seja um cancelamento
      if operacoes = TJOperacoes.JavaClass.CANCELAMENTO then
      begin
        // mEntradaTransacao.informaNsuTransacaoOriginal(cancelamentoFragment.getNSU());
        // mEntradaTransacao.informaCodigoAutorizacaoOriginal(cancelamentoFragment.getCodigoAutorizacao());
        // mEntradaTransacao.informaDataHoraTransacaoOriginal(cancelamentoFragment.getData());
        //Informa novamente o valor para realizar a operação de cancelamento
        // mEntradaTransacao.informaValorTotal(cancelamentoFragment.getValorTrans());
      end;

      mEntradaTransacao.informaTipoCartao(TJCartoes.JavaClass.CARTAO_DEBITO);

      // Defini o tipo de cartão que vai ser usado na operação
      if cbNaoDefinido.IsChecked then
        begin
          mEntradaTransacao.informaTipoCartao(TJCartoes.JavaClass.CARTAO_DESCONHECIDO);
        end
      else if cbCredito.IsChecked then
        begin
          mEntradaTransacao.informaTipoCartao(TJCartoes.JavaClass.CARTAO_CREDITO);
        end

      else if cbDebito.IsChecked then
        begin
          mEntradaTransacao.informaTipoCartao(TJCartoes.JavaClass.CARTAO_DEBITO);
        end

      else if cbVoucher.IsChecked then
        begin
          mEntradaTransacao.informaTipoCartao(TJCartoes.JavaClass.CARTAO_VOUCHER);
        end;

      mEntradaTransacao.informaTipoFinanciamento(TJFinanciamentos.JavaClass.A_VISTA);

      // Define o tipo de parcelamento ou se a operação vai ser A Vista
      if rbParcelamentoNaoDef.IsChecked then
        begin
          mEntradaTransacao.informaTipoFinanciamento(TJFinanciamentos.JavaClass.FINANCIAMENTO_NAO_DEFINIDO);
        end
      else if rbAVista.IsChecked then
        begin
          mEntradaTransacao.informaTipoFinanciamento(TJFinanciamentos.JavaClass.A_VISTA);
        end

      else if rbEmissor.IsChecked then
        begin
          mEntradaTransacao.informaTipoFinanciamento(TJFinanciamentos.JavaClass.PARCELADO_EMISSOR);
          mEntradaTransacao.informaNumeroParcelas(StrToInt(editParcelas.Text));
        end

      else if rbEstabelecimento.IsChecked then
        begin
          mEntradaTransacao.informaTipoFinanciamento(TJFinanciamentos.JavaClass.PARCELADO_ESTABELECIMENTO);
          mEntradaTransacao.informaNumeroParcelas(StrToInt(editParcelas.Text));
        end;

      // Define o provedor que sera usado
      if cbAdquirente.Selected.Text = '' then
        // OK
      else if cbAdquirente.Selected.Text = 'PROVEDOR DESCONHECIDO' then
        // OK
      else
        mEntradaTransacao.informaNomeProvedor(StringToJString(cbAdquirente.Selected.Text));

      try
        try
          begin
            // Moeda que esta sendo usada na operação
            mEntradaTransacao.informaCodigoMoeda(StringToJString('986')); // Real
            mConfimacoes := TJConfirmacoes.Create;

            mSaidaTransacao := mTransacoes.realizaTransacao(mEntradaTransacao);

            if mSaidaTransacao = nil then
                LogAplicacao('mSaidaTransacao esta NIL');

            mConfimacoes.informaIdentificadorConfirmacaoTransacao(
                  mSaidaTransacao.obtemIdentificadorConfirmacaoTransacao
                );
          end;
        except
          on e : EJNIException do
          begin
            mensagemErro := e.Message;
          end;
          on e : Exception do
          begin
            mensagemErro := e.Message;
          end;

        end;
      finally
        mHandler.post(resultadoOperacacao);
      end;
    end
  ).Start;

end;

// **********************************************
function TForm1.resultadoOperacacao : JRunnable;
begin

  LogAplicacao('Ate aqui OK.');
  traduzResultadoOperacao;

end;
// **********************************************

procedure TForm1.traduzResultadoOperacao();
var

  mensagemAlert : string;
  mensagemRetorno : string;

  resultado : Integer;

  confirmaOperacaoManual : Boolean;
  TransacaoPendente : Boolean;

begin

  resultado := -999999;

  if mSaidaTransacao = nil then
    resultado := -999999
  else
    begin

      confirmaOperacaoManual := false;
      TransacaoPendente := false;

      resultado := mSaidaTransacao.obtemResultadoTransacao();

      if resultado = 0 then
        begin
          if mSaidaTransacao.obtemInformacaoConfirmacao() then
            begin
              if cbConfManual.IsChecked then
                begin
                  LogAplicacao('CONFIRMADO_MANUAL');
                  confirmaOperacaoManual := true;
                end
              else
                begin
                  LogAplicacao('CONFIRMADO_AUTOMATICO');
                  mConfimacoes.informaStatusTransacao(TJStatusTransacao.JavaClass.CONFIRMADO_AUTOMATICO);
                  mTransacoes.confirmaTransacao(mConfimacoes);
                end;

            end
          else if mSaidaTransacao.existeTransacaoPendente then
            begin
              LogAplicacao('Tratar');
            end

        end

      else if mSaidaTransacao.existeTransacaoPendente then
        begin
          LogAplicacao('Existe Transação Pendente');
          mConfimacoes := TJConfirmacoes.Create;
          TransacaoPendente := true
        end

      else
        begin
          LogAplicacao('Aconteceu algum erro no processo');
          mensagemAlert := 'Erro';
        end;

      mensagemRetorno := JStringToString(TJString.Wrap(mSaidaTransacao.obtemMensagemResultado.intern));

      if mensagemRetorno.length > 0 then
        begin
          LogAplicacao('Até aqui esta tudo certo');
          LogAplicacao(mensagemRetorno);
          if resultado = 0 then
            begin
              nsu        := JStringToString(mSaidaTransacao.obtemNsuHost);
              codigoAutorizacao := JStringToString(mSaidaTransacao.obtemCodigoAutorizacao);
              valorOperacao     := editValor.Text;

              mensagemAlert := mensagemRetorno;
              mensagemAlert := mensagemAlert + #13#10 + #13#10 + trataMensagemResultado();

            end
          else
            mensagemAlert := mensagemAlert + #13#10 + #13#10 +  mensagemRetorno;

        end
      else if (mensagemErro.length = 0) then
        begin
          if resultado = 0 then
            mensagemAlert := 'Operação OK'
          else
            mensagemAlert := 'Erro: ' + IntToStr(resultado);
        end

      else
        begin
          mensagemAlert := mensagemRetorno;
        end;


      if resultado = 0 then
        begin
          if(confirmaOperacaoManual) then
            begin
              mensagemFim(mensagemAlert);
              ConfirmaOperacao;
            end
          else
            begin
              trataComprovante;
              mensagemFim(mensagemAlert);
            end
        end
      else
        if(TransacaoPendente) then
          existeTransacaoPendente
        else
          mensagemFim(mensagemAlert);

    end;

end;
// **********************************************

function TForm1.trataMensagemResultado : string;
var
  mensagem : string;
begin

  mensagem := 'ID do Cartão: ' + JStringToString(mSaidaTransacao.obtemAidCartao);

  mensagem := mensagem + #13#10 + #13#10 + 'Nome Portador Cartão: ' + JStringToString( mSaidaTransacao.obtemNomePortadorCartao());
  mensagem := mensagem + #13#10 + 'Nome Cartão Padrão: ' + JStringToString( mSaidaTransacao.obtemNomeCartaoPadrao());
  mensagem := mensagem + #13#10 + 'Nome Estabelecimento: ' + JStringToString( mSaidaTransacao.obtemNomeEstabelecimento());

  mensagem := mensagem + #13#10 + #13#10 + 'Pan Mascarado Cartão: ' + JStringToString( mSaidaTransacao.obtemPanMascaradoPadrao());
  mensagem := mensagem + #13#10 + 'Pan Mascarado: ' + JStringToString( mSaidaTransacao.obtemPanMascarado());

  mensagem := mensagem + #13#10 + #13#10 + 'Identificador Transação: ' + JStringToString( mSaidaTransacao.obtemIdentificadorConfirmacaoTransacao());

  mensagem := mensagem + #13#10 + #13#10 + 'NSU Original: ' + JStringToString( mSaidaTransacao.obtemNsuLocalOriginal());
  mensagem := mensagem + #13#10 + 'NSU Local: ' + JStringToString( mSaidaTransacao.obtemNsuLocal());
  mensagem := mensagem + #13#10 + 'NSU Transação: ' + JStringToString( mSaidaTransacao.obtemNsuHost());

  mensagem := mensagem + #13#10 + #13#10 + 'Nome Cartão: ' + JStringToString( mSaidaTransacao.obtemNomeCartao());
  mensagem := mensagem + #13#10 + 'Nome Provedor: ' + JStringToString( mSaidaTransacao.obtemNomeProvedor());

  mensagem := mensagem + #13#10 + #13#10 + 'Modo Verificação Senha: ' + JStringToString( mSaidaTransacao.obtemModoVerificacaoSenha());

  mensagem := mensagem + #13#10 + #13#10 + 'Cod Autorização: ' + JStringToString( mSaidaTransacao.obtemCodigoAutorizacao());
  mensagem := mensagem + #13#10 + 'Cod Autorização Original: ' + JStringToString( mSaidaTransacao.obtemCodigoAutorizacaoOriginal());
  mensagem := mensagem + #13#10 + 'Ponto Captura: ' + JStringToString( mSaidaTransacao.obtemIdentificadorPontoCaptura());

  mensagem := mensagem + #13#10 + #13#10 + 'Valor da Operação: ' + JStringToString( mSaidaTransacao.obtemValorTotal());
  mensagem := mensagem + #13#10 + 'Salvo Voucher: ' + JStringToString( mSaidaTransacao.obtemSaldoVoucher());

  LogAplicacao(mensagem);

  result := mensagem;

end;
// **********************************************

procedure TForm1.mensagemFim(mensagem : string);
begin
  TThread.Synchronize(nil,
    procedure
    begin
      TDialogService.MessageDialog
              (mensagem,
              System.UITypes.TMsgDlgType.mtConfirmation,
              [System.UITypes.TMsgDlgBtn.mbOK],
              System.UITypes.TMsgDlgBtn.mbOK, 0,
              procedure(const AResult: TModalResult)
              begin
                LogAplicacao('Mensagem FIM');
              end);

            end);
end;


// **********************************************
procedure TForm1.ConfirmaOperacao;
begin
  TThread.Synchronize(nil,
    procedure
    begin
      TDialogService.MessageDialog
              ('Deseja confirmar a operação?',
              System.UITypes.TMsgDlgType.mtConfirmation,
              [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo],
              System.UITypes.TMsgDlgBtn.mbYes, 0,
              procedure(const AResult: TModalResult)
              begin
                LogAplicacao('CONFIRMADO_MANUAL');
                if (AResult = mrYES) then
                  begin
                    LogAplicacao('Operador acabou de confirmar a operação.');
                    mConfimacoes.informaStatusTransacao(TJStatusTransacao.JavaClass.CONFIRMADO_MANUAL);
                    mTransacoes.confirmaTransacao(mConfimacoes);
                    trataComprovante;
                  end
                else
                  begin
                    LogAplicacao('Operador acabou de cancelar a operação.');
                    mConfimacoes.informaStatusTransacao(TJStatusTransacao.JavaClass.DESFEITO_MANUAL);
                    mTransacoes.confirmaTransacao(mConfimacoes);
                    trataComprovante;
                  end;
              end);

            end);
end;
// **********************************************

procedure TForm1.existeTransacaoPendente;
begin
  TThread.Synchronize(nil,
    procedure
    begin
      TDialogService.MessageDialog
              ('Deseja confirmar a transação que esta PENDENTE?',
              System.UITypes.TMsgDlgType.mtConfirmation,
              [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo],
              System.UITypes.TMsgDlgBtn.mbYes, 0,
              procedure(const AResult: TModalResult)
              begin
                LogAplicacao('CONFIRMADO_MANUAL');
                if (AResult = mrYES) then
                  begin
                    LogAplicacao('Transação Pendente foi CONFIRMADO_MANUAL.');
                    mConfimacoes.informaStatusTransacao(TJStatusTransacao.JavaClass.CONFIRMADO_MANUAL);
                    mTransacoes.resolvePendencia(mSaidaTransacao.obtemDadosTransacaoPendente, mConfimacoes);
                  end
                else
                  begin
                    LogAplicacao('Transação Pendente foi DESFEITO_ERRO_IMPRESSAO_AUTOMATICO.');
                    mConfimacoes.informaStatusTransacao(TJStatusTransacao.JavaClass.DESFEITO_ERRO_IMPRESSAO_AUTOMATICO);
                    mTransacoes.confirmaTransacao(mConfimacoes);
                  end;
              end);

            end);
end;
// **********************************************

procedure TForm1.trataComprovante;
var
  listCupom : JList;
  iter: JIterator;
  cupom : string;
begin

  if cbViasDif.IsChecked then
    begin
      mViasImpressao := mSaidaTransacao.obtemViasImprimir();

      if ( mViasImpressao.equals(TJViasImpressao.JavaClass.VIA_CLIENTE) )
         or
          ( mViasImpressao.equals(TJViasImpressao.JavaClass.VIA_CLIENTE_E_ESTABELECIMENTO) ) then
         begin
          listCupom := mSaidaTransacao.obtemComprovanteDiferenciadoPortador;
          if listCupom.size > 0  then
            begin
              cupom := '';
              iter := listCupom.iterator;
              while iter.hasNext do
              begin
                cupom := cupom + JStringToString(TJString.Wrap(iter.next).intern);
              end;
              ImpressaoComprovantes('Via Cliente', cupom);

            end;

         end;

      if ( mViasImpressao.equals(TJViasImpressao.JavaClass.VIA_ESTABELECIMENTO) )
          or
         ( mViasImpressao.equals(TJViasImpressao.JavaClass.VIA_CLIENTE_E_ESTABELECIMENTO) ) then
        begin
          listCupom := mSaidaTransacao.obtemComprovanteDiferenciadoLoja;
          if listCupom.size > 0  then
          begin
            cupom := '';
            iter := listCupom.iterator;
            while iter.hasNext do
            begin
              cupom := cupom + JStringToString(TJString.Wrap(iter.next).intern);
            end;
            ImpressaoComprovantes('Via do Estabelecimento', cupom);

          end;

        end;

    end
  else
    begin
      listCupom := mSaidaTransacao.obtemComprovanteCompleto;
      if listCupom.size > 0  then
      begin
        iter := listCupom.iterator;
        while iter.hasNext do
        begin
          cupom := cupom + JStringToString(TJString.Wrap(iter.next).intern);
        end;
        ImpressaoComprovantes('Comprovante Full', cupom);
      end;
    end;

end;

// **********************************************
procedure TForm1.ImpressaoComprovantes(titulo, cupom : string);
begin
  TThread.Synchronize(nil,
    procedure
    begin
      TDialogService.MessageDialog
              ('Deseja imprimir ' + titulo + '?',
              System.UITypes.TMsgDlgType.mtConfirmation,
              [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo],
              System.UITypes.TMsgDlgBtn.mbYes, 0,
              procedure(const AResult: TModalResult)
              begin
                LogAplicacao('Imprimindo ' + titulo);
                if (AResult = mrYES) then
                  begin
                    GertecPrinter.textSize := 18;
                    GertecPrinter.FlagBold := true;
                    GertecPrinter.textFamily := 0;
                    GertecPrinter.PrintString(ESQUERDA, cupom);
                    GertecPrinter.printBlankLine(150);
                    GertecPrinter.printOutput;
                  end;
              end);

            end);
end;
// **********************************************

end.
