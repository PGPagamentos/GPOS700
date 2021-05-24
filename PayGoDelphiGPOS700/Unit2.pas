unit Unit2;

interface

uses
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
  Androidapi.Jni.GraphicsContentViewText, // Required
  Androidapi.JNI.Util,
  Androidapi.Jni.OS;                      // Required

type
  TForm2 = class(TForm)
    Label1: TLabel;
    editNSU: TEdit;
    editCodigoAutorizacao: TEdit;
    editDataTransacao: TEdit;
    editValorTransacao: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnCancelamento: TButton;
    btnConfirmar: TButton;
    procedure btnCancelamentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.btnCancelamentoClick(Sender: TObject);
begin
  Form2.Close;
end;

end.
