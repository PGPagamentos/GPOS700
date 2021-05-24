
unit PayGoSDK;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Os,
  Androidapi.JNI.Util;

type
// ===== Forward declarations =====

  JAnimator = interface;//android.animation.Animator
  JAnimator_AnimatorListener = interface;//android.animation.Animator$AnimatorListener
  JAnimator_AnimatorPauseListener = interface;//android.animation.Animator$AnimatorPauseListener
  JKeyframe = interface;//android.animation.Keyframe
  JLayoutTransition = interface;//android.animation.LayoutTransition
  JLayoutTransition_TransitionListener = interface;//android.animation.LayoutTransition$TransitionListener
  JPropertyValuesHolder = interface;//android.animation.PropertyValuesHolder
  JStateListAnimator = interface;//android.animation.StateListAnimator
  JTimeInterpolator = interface;//android.animation.TimeInterpolator
  JTypeConverter = interface;//android.animation.TypeConverter
  JTypeEvaluator = interface;//android.animation.TypeEvaluator
  JValueAnimator = interface;//android.animation.ValueAnimator
  JValueAnimator_AnimatorUpdateListener = interface;//android.animation.ValueAnimator$AnimatorUpdateListener
  JPathMotion = interface;//android.transition.PathMotion
  JScene = interface;//android.transition.Scene
  JTransition = interface;//android.transition.Transition
  JTransition_EpicenterCallback = interface;//android.transition.Transition$EpicenterCallback
  JTransition_TransitionListener = interface;//android.transition.Transition$TransitionListener
  JTransitionManager = interface;//android.transition.TransitionManager
  JTransitionPropagation = interface;//android.transition.TransitionPropagation
  JTransitionValues = interface;//android.transition.TransitionValues
  JInterpolator = interface;//android.view.animation.Interpolator
  JToolbar_LayoutParams = interface;//android.widget.Toolbar$LayoutParams
  JAplicacaoNaoInstaladaExcecao = interface;//br.com.setis.interfaceautomacao.AplicacaoNaoInstaladaExcecao
  Jinterfaceautomacao_BuildConfig = interface;//br.com.setis.interfaceautomacao.BuildConfig
  JCartoes = interface;//br.com.setis.interfaceautomacao.Cartoes
  JConfirmacao = interface;//br.com.setis.interfaceautomacao.Confirmacao
  JConfirmacoes = interface;//br.com.setis.interfaceautomacao.Confirmacoes
  JDadosAutomacao = interface;//br.com.setis.interfaceautomacao.DadosAutomacao
  JEntradaTransacao = interface;//br.com.setis.interfaceautomacao.EntradaTransacao
  JFinanciamentos = interface;//br.com.setis.interfaceautomacao.Financiamentos
  JGlobalDefs = interface;//br.com.setis.interfaceautomacao.GlobalDefs
  JModalidadesPagamento = interface;//br.com.setis.interfaceautomacao.ModalidadesPagamento
  JOperacoes = interface;//br.com.setis.interfaceautomacao.Operacoes
  JPersonalizacao = interface;//br.com.setis.interfaceautomacao.Personalizacao
  JPersonalizacao_1 = interface;//br.com.setis.interfaceautomacao.Personalizacao$1
  JPersonalizacao_Builder = interface;//br.com.setis.interfaceautomacao.Personalizacao$Builder
  JProvedores = interface;//br.com.setis.interfaceautomacao.Provedores
  JQuedaConexaoTerminalExcecao = interface;//br.com.setis.interfaceautomacao.QuedaConexaoTerminalExcecao
  JSaidaTransacao = interface;//br.com.setis.interfaceautomacao.SaidaTransacao
  JSenderActivity = interface;//br.com.setis.interfaceautomacao.SenderActivity
  JStatusTransacao = interface;//br.com.setis.interfaceautomacao.StatusTransacao
  JTerminal = interface;//br.com.setis.interfaceautomacao.Terminal
  JTerminalDesconectadoExcecao = interface;//br.com.setis.interfaceautomacao.TerminalDesconectadoExcecao
  JTerminalNaoConfiguradoExcecao = interface;//br.com.setis.interfaceautomacao.TerminalNaoConfiguradoExcecao
  JTransacao = interface;//br.com.setis.interfaceautomacao.Transacao
  JTransacaoPendenteDados = interface;//br.com.setis.interfaceautomacao.TransacaoPendenteDados
  JTransacoes = interface;//br.com.setis.interfaceautomacao.Transacoes
  JVersoes = interface;//br.com.setis.interfaceautomacao.Versoes
  JViasImpressao = interface;//br.com.setis.interfaceautomacao.ViasImpressao

// ===== Interface declarations =====

  JAnimatorClass = interface(JObjectClass)
    ['{3F76A5DF-389E-4BD3-9861-04C5B00CEADE}']
    {class} function init: JAnimator; cdecl;
    {class} procedure addListener(listener: JAnimator_AnimatorListener); cdecl;
    {class} procedure addPauseListener(listener: JAnimator_AnimatorPauseListener); cdecl;
    {class} procedure cancel; cdecl;
    {class} function getInterpolator: JTimeInterpolator; cdecl;
    {class} function getListeners: JArrayList; cdecl;
    {class} function isStarted: Boolean; cdecl;
    {class} procedure pause; cdecl;
    {class} procedure removeAllListeners; cdecl;
    {class} function setDuration(duration: Int64): JAnimator; cdecl;
    {class} procedure setInterpolator(value: JTimeInterpolator); cdecl;
    {class} procedure setStartDelay(startDelay: Int64); cdecl;
    {class} procedure start; cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/Animator')]
  JAnimator = interface(JObject)
    ['{FA13E56D-1B6D-4A3D-8327-9E5BA785CF21}']
    function clone: JAnimator; cdecl;
    procedure &end; cdecl;
    function getDuration: Int64; cdecl;
    function getStartDelay: Int64; cdecl;
    function isPaused: Boolean; cdecl;
    function isRunning: Boolean; cdecl;
    procedure removeListener(listener: JAnimator_AnimatorListener); cdecl;
    procedure removePauseListener(listener: JAnimator_AnimatorPauseListener); cdecl;
    procedure resume; cdecl;
    procedure setTarget(target: JObject); cdecl;//Deprecated
    procedure setupEndValues; cdecl;//Deprecated
    procedure setupStartValues; cdecl;//Deprecated
  end;
  TJAnimator = class(TJavaGenericImport<JAnimatorClass, JAnimator>) end;

  JAnimator_AnimatorListenerClass = interface(IJavaClass)
    ['{5ED6075A-B997-469C-B8D9-0AA8FB7E4798}']
    {class} procedure onAnimationEnd(animation: JAnimator); cdecl;//Deprecated
    {class} procedure onAnimationRepeat(animation: JAnimator); cdecl;//Deprecated
    {class} procedure onAnimationStart(animation: JAnimator); cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/Animator$AnimatorListener')]
  JAnimator_AnimatorListener = interface(IJavaInstance)
    ['{E2DE8DD6-628B-4D84-AA46-8A1E3F00FF13}']
    procedure onAnimationCancel(animation: JAnimator); cdecl;//Deprecated
  end;
  TJAnimator_AnimatorListener = class(TJavaGenericImport<JAnimator_AnimatorListenerClass, JAnimator_AnimatorListener>) end;

  JAnimator_AnimatorPauseListenerClass = interface(IJavaClass)
    ['{CB0DC3F0-63BC-4284-ADD0-2ED367AE11E5}']
    {class} procedure onAnimationPause(animation: JAnimator); cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/Animator$AnimatorPauseListener')]
  JAnimator_AnimatorPauseListener = interface(IJavaInstance)
    ['{43C9C106-65EA-4A7D-A958-FAB9E43FA4A6}']
    procedure onAnimationResume(animation: JAnimator); cdecl;
  end;
  TJAnimator_AnimatorPauseListener = class(TJavaGenericImport<JAnimator_AnimatorPauseListenerClass, JAnimator_AnimatorPauseListener>) end;

  JKeyframeClass = interface(JObjectClass)
    ['{D383116E-5CCF-48D8-9EA1-B26FBF24BA39}']
    {class} function init: JKeyframe; cdecl;
    {class} function clone: JKeyframe; cdecl;
    {class} function getFraction: Single; cdecl;
    {class} function getInterpolator: JTimeInterpolator; cdecl;
    {class} function ofFloat(fraction: Single; value: Single): JKeyframe; cdecl; overload;//Deprecated
    {class} function ofFloat(fraction: Single): JKeyframe; cdecl; overload;//Deprecated
    {class} function ofInt(fraction: Single; value: Integer): JKeyframe; cdecl; overload;//Deprecated
    {class} function ofInt(fraction: Single): JKeyframe; cdecl; overload;//Deprecated
    {class} function ofObject(fraction: Single; value: JObject): JKeyframe; cdecl; overload;//Deprecated
    {class} function ofObject(fraction: Single): JKeyframe; cdecl; overload;//Deprecated
    {class} procedure setFraction(fraction: Single); cdecl;//Deprecated
    {class} procedure setInterpolator(interpolator: JTimeInterpolator); cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/Keyframe')]
  JKeyframe = interface(JObject)
    ['{9D0687A4-669E-440F-8290-154739405019}']
    function getType: Jlang_Class; cdecl;//Deprecated
    function getValue: JObject; cdecl;//Deprecated
    function hasValue: Boolean; cdecl;//Deprecated
    procedure setValue(value: JObject); cdecl;//Deprecated
  end;
  TJKeyframe = class(TJavaGenericImport<JKeyframeClass, JKeyframe>) end;

  JLayoutTransitionClass = interface(JObjectClass)
    ['{433C5359-0A96-4796-AD7B-8084EF7EF7C4}']
    {class} function _GetAPPEARING: Integer; cdecl;
    {class} function _GetCHANGE_APPEARING: Integer; cdecl;
    {class} function _GetCHANGE_DISAPPEARING: Integer; cdecl;
    {class} function _GetCHANGING: Integer; cdecl;
    {class} function _GetDISAPPEARING: Integer; cdecl;
    {class} function init: JLayoutTransition; cdecl;
    {class} procedure addTransitionListener(listener: JLayoutTransition_TransitionListener); cdecl;
    {class} procedure disableTransitionType(transitionType: Integer); cdecl;
    {class} procedure enableTransitionType(transitionType: Integer); cdecl;
    {class} function getStagger(transitionType: Integer): Int64; cdecl;
    {class} function getStartDelay(transitionType: Integer): Int64; cdecl;
    {class} function isChangingLayout: Boolean; cdecl;
    {class} function isRunning: Boolean; cdecl;
    {class} function isTransitionTypeEnabled(transitionType: Integer): Boolean; cdecl;
    {class} procedure setAnimator(transitionType: Integer; animator: JAnimator); cdecl;//Deprecated
    {class} procedure setDuration(duration: Int64); cdecl; overload;//Deprecated
    {class} procedure setDuration(transitionType: Integer; duration: Int64); cdecl; overload;//Deprecated
    {class} procedure showChild(parent: JViewGroup; child: JView); cdecl; overload;//Deprecated
    {class} procedure showChild(parent: JViewGroup; child: JView; oldVisibility: Integer); cdecl; overload;//Deprecated
    {class} property APPEARING: Integer read _GetAPPEARING;
    {class} property CHANGE_APPEARING: Integer read _GetCHANGE_APPEARING;
    {class} property CHANGE_DISAPPEARING: Integer read _GetCHANGE_DISAPPEARING;
    {class} property CHANGING: Integer read _GetCHANGING;
    {class} property DISAPPEARING: Integer read _GetDISAPPEARING;
  end;

  [JavaSignature('android/animation/LayoutTransition')]
  JLayoutTransition = interface(JObject)
    ['{42450BEE-EBF2-4954-B9B7-F8DAE7DF0EC1}']
    procedure addChild(parent: JViewGroup; child: JView); cdecl;
    function getAnimator(transitionType: Integer): JAnimator; cdecl;
    function getDuration(transitionType: Integer): Int64; cdecl;
    function getInterpolator(transitionType: Integer): JTimeInterpolator; cdecl;
    function getTransitionListeners: JList; cdecl;
    procedure hideChild(parent: JViewGroup; child: JView); cdecl; overload;//Deprecated
    procedure hideChild(parent: JViewGroup; child: JView; newVisibility: Integer); cdecl; overload;
    procedure removeChild(parent: JViewGroup; child: JView); cdecl;//Deprecated
    procedure removeTransitionListener(listener: JLayoutTransition_TransitionListener); cdecl;//Deprecated
    procedure setAnimateParentHierarchy(animateParentHierarchy: Boolean); cdecl;//Deprecated
    procedure setInterpolator(transitionType: Integer; interpolator: JTimeInterpolator); cdecl;//Deprecated
    procedure setStagger(transitionType: Integer; duration: Int64); cdecl;//Deprecated
    procedure setStartDelay(transitionType: Integer; delay: Int64); cdecl;//Deprecated
  end;
  TJLayoutTransition = class(TJavaGenericImport<JLayoutTransitionClass, JLayoutTransition>) end;

  JLayoutTransition_TransitionListenerClass = interface(IJavaClass)
    ['{9FA6F1EC-8EDB-4A05-AF58-B55A525AE114}']
  end;

  [JavaSignature('android/animation/LayoutTransition$TransitionListener')]
  JLayoutTransition_TransitionListener = interface(IJavaInstance)
    ['{0FBE048F-FCDA-4692-B6F1-DE0F07FAE885}']
    procedure endTransition(transition: JLayoutTransition; container: JViewGroup; view: JView; transitionType: Integer); cdecl;
    procedure startTransition(transition: JLayoutTransition; container: JViewGroup; view: JView; transitionType: Integer); cdecl;
  end;
  TJLayoutTransition_TransitionListener = class(TJavaGenericImport<JLayoutTransition_TransitionListenerClass, JLayoutTransition_TransitionListener>) end;

  JPropertyValuesHolderClass = interface(JObjectClass)
    ['{36C77AFF-9C3F-42B6-88F3-320FE8CF9B25}']
    {class} function ofMultiFloat(propertyName: JString; values: TJavaBiArray<Single>): JPropertyValuesHolder; cdecl; overload;//Deprecated
    {class} function ofMultiFloat(propertyName: JString; path: JPath): JPropertyValuesHolder; cdecl; overload;//Deprecated
    {class} function ofMultiInt(propertyName: JString; values: TJavaBiArray<Integer>): JPropertyValuesHolder; cdecl; overload;
    {class} function ofMultiInt(propertyName: JString; path: JPath): JPropertyValuesHolder; cdecl; overload;
    {class} function ofObject(propertyName: JString; converter: JTypeConverter; path: JPath): JPropertyValuesHolder; cdecl; overload;
    {class} function ofObject(property_: JProperty; converter: JTypeConverter; path: JPath): JPropertyValuesHolder; cdecl; overload;
    {class} procedure setConverter(converter: JTypeConverter); cdecl;
    {class} procedure setEvaluator(evaluator: JTypeEvaluator); cdecl;
    {class} procedure setProperty(property_: JProperty); cdecl;
    {class} procedure setPropertyName(propertyName: JString); cdecl;
  end;

  [JavaSignature('android/animation/PropertyValuesHolder')]
  JPropertyValuesHolder = interface(JObject)
    ['{12B4ABFD-CBCA-4636-AF2D-C386EF895DC3}']
    function clone: JPropertyValuesHolder; cdecl;//Deprecated
    function getPropertyName: JString; cdecl;//Deprecated
    function toString: JString; cdecl;
  end;
  TJPropertyValuesHolder = class(TJavaGenericImport<JPropertyValuesHolderClass, JPropertyValuesHolder>) end;

  JStateListAnimatorClass = interface(JObjectClass)
    ['{109E4067-E218-47B1-93EB-65B8916A98D8}']
    {class} function init: JStateListAnimator; cdecl;
    {class} procedure jumpToCurrentState; cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/StateListAnimator')]
  JStateListAnimator = interface(JObject)
    ['{CA2A9587-26AA-4DC2-8DFF-A1305A37608F}']
    procedure addState(specs: TJavaArray<Integer>; animator: JAnimator); cdecl;//Deprecated
    function clone: JStateListAnimator; cdecl;//Deprecated
  end;
  TJStateListAnimator = class(TJavaGenericImport<JStateListAnimatorClass, JStateListAnimator>) end;

  JTimeInterpolatorClass = interface(IJavaClass)
    ['{1E682A1C-9102-461D-A3CA-5596683F1D66}']
  end;

  [JavaSignature('android/animation/TimeInterpolator')]
  JTimeInterpolator = interface(IJavaInstance)
    ['{639F8A83-7D9B-49AF-A19E-96B27E46D2AB}']
    function getInterpolation(input: Single): Single; cdecl;
  end;
  TJTimeInterpolator = class(TJavaGenericImport<JTimeInterpolatorClass, JTimeInterpolator>) end;

  JTypeConverterClass = interface(JObjectClass)
    ['{BE2DD177-6D79-4B0C-B4F5-4E4CD9D7436D}']
    {class} function init(fromClass: Jlang_Class; toClass: Jlang_Class): JTypeConverter; cdecl;
    {class} function convert(value: JObject): JObject; cdecl;
  end;

  [JavaSignature('android/animation/TypeConverter')]
  JTypeConverter = interface(JObject)
    ['{BFEA4116-0766-4AD9-AA8F-4C15A583EB2E}']
  end;
  TJTypeConverter = class(TJavaGenericImport<JTypeConverterClass, JTypeConverter>) end;

  JTypeEvaluatorClass = interface(IJavaClass)
    ['{15B67CAF-6F50-4AA3-A88F-C5AF78D62FD4}']
  end;

  [JavaSignature('android/animation/TypeEvaluator')]
  JTypeEvaluator = interface(IJavaInstance)
    ['{F436383D-6F44-40D8-ACDD-9057777691FC}']
    function evaluate(fraction: Single; startValue: JObject; endValue: JObject): JObject; cdecl;
  end;
  TJTypeEvaluator = class(TJavaGenericImport<JTypeEvaluatorClass, JTypeEvaluator>) end;

  JValueAnimatorClass = interface(JAnimatorClass)
    ['{FF3B71ED-5A33-45B0-8500-7672B0B98E2C}']
    {class} function _GetINFINITE: Integer; cdecl;
    {class} function _GetRESTART: Integer; cdecl;
    {class} function _GetREVERSE: Integer; cdecl;
    {class} function init: JValueAnimator; cdecl;
    {class} procedure &end; cdecl;//Deprecated
    {class} function getAnimatedFraction: Single; cdecl;//Deprecated
    {class} function getDuration: Int64; cdecl;//Deprecated
    {class} function getFrameDelay: Int64; cdecl;//Deprecated
    {class} function getStartDelay: Int64; cdecl;//Deprecated
    {class} function getValues: TJavaObjectArray<JPropertyValuesHolder>; cdecl;//Deprecated
    {class} function isRunning: Boolean; cdecl;//Deprecated
    {class} procedure resume; cdecl;
    {class} procedure reverse; cdecl;
    {class} procedure setCurrentFraction(fraction: Single); cdecl;
    {class} procedure setFrameDelay(frameDelay: Int64); cdecl;
    {class} procedure setRepeatMode(value: Integer); cdecl;
    {class} procedure setStartDelay(startDelay: Int64); cdecl;
    {class} property INFINITE: Integer read _GetINFINITE;
    {class} property RESTART: Integer read _GetRESTART;
    {class} property REVERSE: Integer read _GetREVERSE;
  end;

  [JavaSignature('android/animation/ValueAnimator')]
  JValueAnimator = interface(JAnimator)
    ['{70F92B14-EFD4-4DC7-91DE-6617417AE194}']
    procedure addUpdateListener(listener: JValueAnimator_AnimatorUpdateListener); cdecl;//Deprecated
    procedure cancel; cdecl;//Deprecated
    function clone: JValueAnimator; cdecl;//Deprecated
    function getAnimatedValue: JObject; cdecl; overload;//Deprecated
    function getAnimatedValue(propertyName: JString): JObject; cdecl; overload;//Deprecated
    function getCurrentPlayTime: Int64; cdecl;//Deprecated
    function getInterpolator: JTimeInterpolator; cdecl;//Deprecated
    function getRepeatCount: Integer; cdecl;//Deprecated
    function getRepeatMode: Integer; cdecl;//Deprecated
    function isStarted: Boolean; cdecl;//Deprecated
    procedure pause; cdecl;
    procedure removeAllUpdateListeners; cdecl;
    procedure removeUpdateListener(listener: JValueAnimator_AnimatorUpdateListener); cdecl;
    procedure setCurrentPlayTime(playTime: Int64); cdecl;
    function setDuration(duration: Int64): JValueAnimator; cdecl;
    procedure setEvaluator(value: JTypeEvaluator); cdecl;
    procedure setInterpolator(value: JTimeInterpolator); cdecl;
    procedure setRepeatCount(value: Integer); cdecl;
    procedure start; cdecl;
    function toString: JString; cdecl;
  end;
  TJValueAnimator = class(TJavaGenericImport<JValueAnimatorClass, JValueAnimator>) end;

  JValueAnimator_AnimatorUpdateListenerClass = interface(IJavaClass)
    ['{9CA50CBF-4462-4445-82CD-13CE985E2DE4}']
  end;

  [JavaSignature('android/animation/ValueAnimator$AnimatorUpdateListener')]
  JValueAnimator_AnimatorUpdateListener = interface(IJavaInstance)
    ['{0F883491-52EF-4A40-B7D2-FC23E11E46FE}']
    procedure onAnimationUpdate(animation: JValueAnimator); cdecl;
  end;
  TJValueAnimator_AnimatorUpdateListener = class(TJavaGenericImport<JValueAnimator_AnimatorUpdateListenerClass, JValueAnimator_AnimatorUpdateListener>) end;

  JPathMotionClass = interface(JObjectClass)
    ['{E1CD1A94-115C-492C-A490-37F0E72956EB}']
    {class} function init: JPathMotion; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet): JPathMotion; cdecl; overload;
    {class} function getPath(startX: Single; startY: Single; endX: Single; endY: Single): JPath; cdecl;
  end;

  [JavaSignature('android/transition/PathMotion')]
  JPathMotion = interface(JObject)
    ['{BDC08353-C9FB-42D7-97CC-C35837D2F536}']
  end;
  TJPathMotion = class(TJavaGenericImport<JPathMotionClass, JPathMotion>) end;

  JSceneClass = interface(JObjectClass)
    ['{8B9120CA-AEEA-4DE3-BDC9-15CFD23A7B07}']
    {class} function init(sceneRoot: JViewGroup): JScene; cdecl; overload;
    {class} function init(sceneRoot: JViewGroup; layout: JView): JScene; cdecl; overload;
    {class} function init(sceneRoot: JViewGroup; layout: JViewGroup): JScene; cdecl; overload;//Deprecated
    {class} procedure enter; cdecl;//Deprecated
    {class} procedure exit; cdecl;//Deprecated
    {class} function getSceneForLayout(sceneRoot: JViewGroup; layoutId: Integer; context: JContext): JScene; cdecl;
    {class} procedure setExitAction(action: JRunnable); cdecl;
  end;

  [JavaSignature('android/transition/Scene')]
  JScene = interface(JObject)
    ['{85A60B99-5837-4F1F-A344-C627DD586B82}']
    function getSceneRoot: JViewGroup; cdecl;
    procedure setEnterAction(action: JRunnable); cdecl;
  end;
  TJScene = class(TJavaGenericImport<JSceneClass, JScene>) end;

  JTransitionClass = interface(JObjectClass)
    ['{60EC06BC-8F7A-4416-A04B-5B57987EB18E}']
    {class} function _GetMATCH_ID: Integer; cdecl;
    {class} function _GetMATCH_INSTANCE: Integer; cdecl;
    {class} function _GetMATCH_ITEM_ID: Integer; cdecl;
    {class} function _GetMATCH_NAME: Integer; cdecl;
    {class} function init: JTransition; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet): JTransition; cdecl; overload;
    {class} function addTarget(targetName: JString): JTransition; cdecl; overload;//Deprecated
    {class} function addTarget(targetType: Jlang_Class): JTransition; cdecl; overload;//Deprecated
    {class} function addTarget(target: JView): JTransition; cdecl; overload;//Deprecated
    {class} function clone: JTransition; cdecl;//Deprecated
    {class} function createAnimator(sceneRoot: JViewGroup; startValues: JTransitionValues; endValues: JTransitionValues): JAnimator; cdecl;//Deprecated
    {class} function excludeChildren(targetId: Integer; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    {class} function excludeTarget(targetName: JString; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    {class} function excludeTarget(target: JView; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    {class} function excludeTarget(type_: Jlang_Class; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    {class} function getInterpolator: JTimeInterpolator; cdecl;
    {class} function getName: JString; cdecl;
    {class} function getTargetIds: JList; cdecl;
    {class} function getTargetNames: JList; cdecl;
    {class} function getTargetTypes: JList; cdecl;
    {class} function isTransitionRequired(startValues: JTransitionValues; endValues: JTransitionValues): Boolean; cdecl;
    {class} function removeListener(listener: JTransition_TransitionListener): JTransition; cdecl;
    {class} function removeTarget(targetId: Integer): JTransition; cdecl; overload;
    {class} function setDuration(duration: Int64): JTransition; cdecl;
    {class} procedure setEpicenterCallback(epicenterCallback: JTransition_EpicenterCallback); cdecl;
    {class} function setInterpolator(interpolator: JTimeInterpolator): JTransition; cdecl;
    {class} function setStartDelay(startDelay: Int64): JTransition; cdecl;//Deprecated
    {class} function toString: JString; cdecl;//Deprecated
    {class} property MATCH_ID: Integer read _GetMATCH_ID;
    {class} property MATCH_INSTANCE: Integer read _GetMATCH_INSTANCE;
    {class} property MATCH_ITEM_ID: Integer read _GetMATCH_ITEM_ID;
    {class} property MATCH_NAME: Integer read _GetMATCH_NAME;
  end;

  [JavaSignature('android/transition/Transition')]
  JTransition = interface(JObject)
    ['{C2F8200F-1C83-40AE-8C5B-C0C8BFF17F88}']
    function addListener(listener: JTransition_TransitionListener): JTransition; cdecl;//Deprecated
    function addTarget(targetId: Integer): JTransition; cdecl; overload;//Deprecated
    function canRemoveViews: Boolean; cdecl;//Deprecated
    procedure captureEndValues(transitionValues: JTransitionValues); cdecl;//Deprecated
    procedure captureStartValues(transitionValues: JTransitionValues); cdecl;//Deprecated
    function excludeChildren(target: JView; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    function excludeChildren(type_: Jlang_Class; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    function excludeTarget(targetId: Integer; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    function getDuration: Int64; cdecl;
    function getEpicenter: JRect; cdecl;
    function getEpicenterCallback: JTransition_EpicenterCallback; cdecl;
    function getPathMotion: JPathMotion; cdecl;
    function getPropagation: JTransitionPropagation; cdecl;
    function getStartDelay: Int64; cdecl;
    function getTargets: JList; cdecl;
    function getTransitionProperties: TJavaObjectArray<JString>; cdecl;
    function getTransitionValues(view: JView; start: Boolean): JTransitionValues; cdecl;
    function removeTarget(targetName: JString): JTransition; cdecl; overload;
    function removeTarget(target: JView): JTransition; cdecl; overload;
    function removeTarget(target: Jlang_Class): JTransition; cdecl; overload;
    procedure setPathMotion(pathMotion: JPathMotion); cdecl;//Deprecated
    procedure setPropagation(transitionPropagation: JTransitionPropagation); cdecl;//Deprecated
  end;
  TJTransition = class(TJavaGenericImport<JTransitionClass, JTransition>) end;

  JTransition_EpicenterCallbackClass = interface(JObjectClass)
    ['{8141257A-130B-466C-A08D-AA3A00946F4C}']
    {class} function init: JTransition_EpicenterCallback; cdecl;
    {class} function onGetEpicenter(transition: JTransition): JRect; cdecl;//Deprecated
  end;

  [JavaSignature('android/transition/Transition$EpicenterCallback')]
  JTransition_EpicenterCallback = interface(JObject)
    ['{CE004917-266F-4076-8913-F23184824FBA}']
  end;
  TJTransition_EpicenterCallback = class(TJavaGenericImport<JTransition_EpicenterCallbackClass, JTransition_EpicenterCallback>) end;

  JTransition_TransitionListenerClass = interface(IJavaClass)
    ['{D5083752-E8A6-46DF-BE40-AE11073C387E}']
    {class} procedure onTransitionCancel(transition: JTransition); cdecl;//Deprecated
    {class} procedure onTransitionStart(transition: JTransition); cdecl;//Deprecated
  end;

  [JavaSignature('android/transition/Transition$TransitionListener')]
  JTransition_TransitionListener = interface(IJavaInstance)
    ['{C32BE107-6E05-4898-AF0A-FAD970D66E29}']
    procedure onTransitionEnd(transition: JTransition); cdecl;//Deprecated
    procedure onTransitionPause(transition: JTransition); cdecl;//Deprecated
    procedure onTransitionResume(transition: JTransition); cdecl;//Deprecated
  end;
  TJTransition_TransitionListener = class(TJavaGenericImport<JTransition_TransitionListenerClass, JTransition_TransitionListener>) end;

  JTransitionManagerClass = interface(JObjectClass)
    ['{4160EFA0-3499-4964-817E-46497BB5B957}']
    {class} function init: JTransitionManager; cdecl;
    {class} procedure beginDelayedTransition(sceneRoot: JViewGroup); cdecl; overload;
    {class} procedure beginDelayedTransition(sceneRoot: JViewGroup; transition: JTransition); cdecl; overload;
    {class} procedure endTransitions(sceneRoot: JViewGroup); cdecl;
    {class} procedure go(scene: JScene); cdecl; overload;
    {class} procedure go(scene: JScene; transition: JTransition); cdecl; overload;
    {class} procedure transitionTo(scene: JScene); cdecl;
  end;

  [JavaSignature('android/transition/TransitionManager')]
  JTransitionManager = interface(JObject)
    ['{FF5E1210-1F04-4F81-9CAC-3D7A5C4E972B}']
    procedure setTransition(scene: JScene; transition: JTransition); cdecl; overload;
    procedure setTransition(fromScene: JScene; toScene: JScene; transition: JTransition); cdecl; overload;
  end;
  TJTransitionManager = class(TJavaGenericImport<JTransitionManagerClass, JTransitionManager>) end;

  JTransitionPropagationClass = interface(JObjectClass)
    ['{A881388A-C877-4DD9-9BAD-1BA4F56133EE}']
    {class} function init: JTransitionPropagation; cdecl;
    {class} function getStartDelay(sceneRoot: JViewGroup; transition: JTransition; startValues: JTransitionValues; endValues: JTransitionValues): Int64; cdecl;//Deprecated
  end;

  [JavaSignature('android/transition/TransitionPropagation')]
  JTransitionPropagation = interface(JObject)
    ['{7595B7EF-6BCE-4281-BC67-335E2FB6C091}']
    procedure captureValues(transitionValues: JTransitionValues); cdecl;//Deprecated
    function getPropagationProperties: TJavaObjectArray<JString>; cdecl;//Deprecated
  end;
  TJTransitionPropagation = class(TJavaGenericImport<JTransitionPropagationClass, JTransitionPropagation>) end;

  JTransitionValuesClass = interface(JObjectClass)
    ['{3BF98CFA-6A4D-4815-8D42-15E97C916D91}']
    {class} function _Getview: JView; cdecl;
    {class} procedure _Setview(Value: JView); cdecl;
    {class} function init: JTransitionValues; cdecl;
    {class} function equals(other: JObject): Boolean; cdecl;//Deprecated
    {class} property view: JView read _Getview write _Setview;
  end;

  [JavaSignature('android/transition/TransitionValues')]
  JTransitionValues = interface(JObject)
    ['{178E09E6-D32C-48A9-ADCF-8CCEA804052A}']
    function _Getvalues: JMap; cdecl;
    function hashCode: Integer; cdecl;//Deprecated
    function toString: JString; cdecl;//Deprecated
    property values: JMap read _Getvalues;
  end;
  TJTransitionValues = class(TJavaGenericImport<JTransitionValuesClass, JTransitionValues>) end;

  JInterpolatorClass = interface(JTimeInterpolatorClass)
    ['{A575B46A-E489-409C-807A-1B8F2BE092E8}']
  end;

  [JavaSignature('android/view/animation/Interpolator')]
  JInterpolator = interface(JTimeInterpolator)
    ['{F1082403-52DA-4AF0-B017-DAB334325FC7}']
  end;
  TJInterpolator = class(TJavaGenericImport<JInterpolatorClass, JInterpolator>) end;

  JToolbar_LayoutParamsClass = interface(JActionBar_LayoutParamsClass)
    ['{6D43796C-C163-4084-BB30-6FE68AFD7ABB}']
    {class} function init(c: JContext; attrs: JAttributeSet): JToolbar_LayoutParams; cdecl; overload;
    {class} function init(width: Integer; height: Integer): JToolbar_LayoutParams; cdecl; overload;
    {class} function init(width: Integer; height: Integer; gravity: Integer): JToolbar_LayoutParams; cdecl; overload;
    {class} function init(gravity: Integer): JToolbar_LayoutParams; cdecl; overload;
    {class} function init(source: JToolbar_LayoutParams): JToolbar_LayoutParams; cdecl; overload;
    {class} function init(source: JActionBar_LayoutParams): JToolbar_LayoutParams; cdecl; overload;
    {class} function init(source: JViewGroup_MarginLayoutParams): JToolbar_LayoutParams; cdecl; overload;
    {class} function init(source: JViewGroup_LayoutParams): JToolbar_LayoutParams; cdecl; overload;
  end;

  [JavaSignature('android/widget/Toolbar$LayoutParams')]
  JToolbar_LayoutParams = interface(JActionBar_LayoutParams)
    ['{BCD101F9-B7B7-4B2F-9460-056B3EA7B9F0}']
  end;
  TJToolbar_LayoutParams = class(TJavaGenericImport<JToolbar_LayoutParamsClass, JToolbar_LayoutParams>) end;

  JAplicacaoNaoInstaladaExcecaoClass = interface(JExceptionClass)
    ['{72250C7E-8EC4-4645-AA40-3FA2751AF16D}']
    {class} function init: JAplicacaoNaoInstaladaExcecao; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/AplicacaoNaoInstaladaExcecao')]
  JAplicacaoNaoInstaladaExcecao = interface(JException)
    ['{D0A9A69C-0F97-4F34-A308-E10BCA2DFFBD}']
    {class} function init: JAplicacaoNaoInstaladaExcecao; cdecl;//Deprecated
  end;
  TJAplicacaoNaoInstaladaExcecao = class(TJavaGenericImport<JAplicacaoNaoInstaladaExcecaoClass, JAplicacaoNaoInstaladaExcecao>) end;

  Jinterfaceautomacao_BuildConfigClass = interface(JObjectClass)
    ['{927B650D-03B6-44D3-8550-E0B2574AF46C}']
    {class} function _GetAPPLICATION_ID: JString; cdecl;
    {class} function _GetBUILD_TYPE: JString; cdecl;
    {class} function _GetDEBUG: Boolean; cdecl;
    {class} function _GetFLAVOR: JString; cdecl;
    {class} function _GetVERSION_CODE: Integer; cdecl;
    {class} function _GetVERSION_NAME: JString; cdecl;
    {class} function init: Jinterfaceautomacao_BuildConfig; cdecl;//Deprecated
    {class} property APPLICATION_ID: JString read _GetAPPLICATION_ID;
    {class} property BUILD_TYPE: JString read _GetBUILD_TYPE;
    {class} property DEBUG: Boolean read _GetDEBUG;
    {class} property FLAVOR: JString read _GetFLAVOR;
    {class} property VERSION_CODE: Integer read _GetVERSION_CODE;
    {class} property VERSION_NAME: JString read _GetVERSION_NAME;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/BuildConfig')]
  Jinterfaceautomacao_BuildConfig = interface(JObject)
    ['{74265014-2ADC-4A53-A702-B7F4581369A2}']
  end;
  TJinterfaceautomacao_BuildConfig = class(TJavaGenericImport<Jinterfaceautomacao_BuildConfigClass, Jinterfaceautomacao_BuildConfig>) end;

  JCartoesClass = interface(JEnumClass)
    ['{861AE7BE-2626-43BD-A55A-99F00F7D0ED0}']
    {class} function _GetCARTAO_CREDITO: JCartoes; cdecl;
    {class} function _GetCARTAO_DEBITO: JCartoes; cdecl;
    {class} function _GetCARTAO_DESCONHECIDO: JCartoes; cdecl;
    {class} function _GetCARTAO_VOUCHER: JCartoes; cdecl;
    {class} function obtemCartao(P1: Integer): JCartoes; cdecl;//Deprecated
    {class} function obtemTipoCartao: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: JString): JCartoes; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JCartoes>; cdecl;//Deprecated
    {class} property CARTAO_CREDITO: JCartoes read _GetCARTAO_CREDITO;
    {class} property CARTAO_DEBITO: JCartoes read _GetCARTAO_DEBITO;
    {class} property CARTAO_DESCONHECIDO: JCartoes read _GetCARTAO_DESCONHECIDO;
    {class} property CARTAO_VOUCHER: JCartoes read _GetCARTAO_VOUCHER;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Cartoes')]
  JCartoes = interface(JEnum)
    ['{AC8A8422-B2B1-473F-8A35-C21635A03634}']
  end;
  TJCartoes = class(TJavaGenericImport<JCartoesClass, JCartoes>) end;

  JConfirmacaoClass = interface(JSerializableClass)
    ['{CD3AEC26-BD31-4D98-A392-F5B8F9993615}']
    {class} function informaStatusTransacao(P1: JStatusTransacao): JConfirmacao; cdecl;//Deprecated
    {class} function init: JConfirmacao; cdecl;//Deprecated
    {class} function obtemStatusTransacao: JStatusTransacao; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Confirmacao')]
  JConfirmacao = interface(JSerializable)
    ['{DD42E0CF-18D1-4108-B58D-4991F73AE39E}']
    {class} function informaStatusTransacao(P1: JStatusTransacao): JConfirmacao; cdecl;//Deprecated
    {class} function init: JConfirmacao; cdecl;//Deprecated
    {class} function obtemStatusTransacao: JStatusTransacao; cdecl;//Deprecated
  end;
  TJConfirmacao = class(TJavaGenericImport<JConfirmacaoClass, JConfirmacao>) end;

  JConfirmacoesClass = interface(JConfirmacaoClass)
    ['{039C8075-5BFE-4868-BA76-B7E1C434C588}']
    {class} function informaIdentificadorConfirmacaoTransacao(P1: JString): JConfirmacoes; cdecl;//Deprecated
    {class} function init: JConfirmacoes; cdecl;//Deprecated
    {class} function obtemIdentificadorTransacao: JString; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Confirmacoes')]
  JConfirmacoes = interface(JConfirmacao)
    ['{EC5D0705-0FDD-4C91-88DD-FB442C7575A3}']
    {class} function informaIdentificadorConfirmacaoTransacao(P1: JString): JConfirmacoes; cdecl;//Deprecated
    {class} function init: JConfirmacoes; cdecl;//Deprecated
    {class} function obtemIdentificadorTransacao: JString; cdecl;//Deprecated
  end;
  TJConfirmacoes = class(TJavaGenericImport<JConfirmacoesClass, JConfirmacoes>) end;

  JDadosAutomacaoClass = interface(JSerializableClass)
    ['{3DCEB1E1-BB5A-4617-9F0C-9D019F40C9ED}']
    {class} function init(P1: JString; P2: JString; P3: JString; P4: Boolean; P5: Boolean; P6: Boolean; P7: Boolean; P8: JPersonalizacao): JDadosAutomacao; cdecl;//Deprecated
    {class} function obtemEmpresaAutomacao: JString; cdecl;//Deprecated
    {class} function obtemNomeAutomacao: JString; cdecl;//Deprecated
    {class} function obtemPersonalizacaoCliente: JPersonalizacao; cdecl;//Deprecated
    {class} function obtemVersaoAutomacao: JString; cdecl;//Deprecated
    {class} function suportaDesconto: Boolean; cdecl;//Deprecated
    {class} function suportaTroco: Boolean; cdecl;//Deprecated
    {class} function suportaViaReduzida: Boolean; cdecl;//Deprecated
    {class} function suportaViasDiferneciadas: Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/DadosAutomacao')]
  JDadosAutomacao = interface(JSerializable)
    ['{12991BEF-6577-44AF-806D-9119B829D5BD}']
    {class} function init(P1: JString; P2: JString; P3: JString; P4: Boolean; P5: Boolean; P6: Boolean; P7: Boolean; P8: JPersonalizacao): JDadosAutomacao; cdecl;//Deprecated
    {class} function obtemEmpresaAutomacao: JString; cdecl;//Deprecated
    {class} function obtemNomeAutomacao: JString; cdecl;//Deprecated
    {class} function obtemPersonalizacaoCliente: JPersonalizacao; cdecl;//Deprecated
    {class} function obtemVersaoAutomacao: JString; cdecl;//Deprecated
    {class} function suportaDesconto: Boolean; cdecl;//Deprecated
    {class} function suportaTroco: Boolean; cdecl;//Deprecated
    {class} function suportaViaReduzida: Boolean; cdecl;//Deprecated
    {class} function suportaViasDiferneciadas: Boolean; cdecl;//Deprecated
  end;
  TJDadosAutomacao = class(TJavaGenericImport<JDadosAutomacaoClass, JDadosAutomacao>) end;

  JEntradaTransacaoClass = interface(JSerializableClass)
    ['{642A13C7-BB87-471F-8953-55A8E1CF4C24}']
    {class} function informaCodigoAutorizacaoOriginal(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaCodigoMoeda(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaDadosAdicionaisAutomacao1(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaDadosAdicionaisAutomacao2(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaDadosAdicionaisAutomacao3(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaDadosAdicionaisAutomacao4(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaDataHoraTransacaoOriginal(P1: JDate): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaDataPredatado(P1: JDate): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaDocumentoFiscal(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaEstabelecimentoCNPJouCPF(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaModalidadePagamento(P1: JModalidadesPagamento): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaNomeProvedor(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaNsuTransacaoOriginal(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaNumeroFatura(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaNumeroParcelas(P1: Integer): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaNumeroTelefone(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaProvedor(P1: JProvedores): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaTaxaEmbarque(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaTaxaServico(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaTipoCartao(P1: JCartoes): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaTipoFinanciamento(P1: JFinanciamentos): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaValorTotal(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function init(P1: JOperacoes; P2: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function obtemCodigoAutorizacaoOriginal: JString; cdecl;//Deprecated
    {class} function obtemCodigoMoeda: JString; cdecl;//Deprecated
    {class} function obtemDadosAdicionaisAutomacao1: JString; cdecl;//Deprecated
    {class} function obtemDadosAdicionaisAutomacao2: JString; cdecl;//Deprecated
    {class} function obtemDadosAdicionaisAutomacao3: JString; cdecl;//Deprecated
    {class} function obtemDadosAdicionaisAutomacao4: JString; cdecl;//Deprecated
    {class} function obtemDataHoraTransacaoOriginal: JDate; cdecl;//Deprecated
    {class} function obtemDataPredatado: JDate; cdecl;//Deprecated
    {class} function obtemDocumentoFiscal: JString; cdecl;//Deprecated
    {class} function obtemEstabelecimentoCNPJouCPF: JString; cdecl;//Deprecated
    {class} function obtemIdTransacaoAutomacao: JString; cdecl;//Deprecated
    {class} function obtemModalidadePagamento: JModalidadesPagamento; cdecl;//Deprecated
    {class} function obtemNomeProvedor: JString; cdecl;//Deprecated
    {class} function obtemNsuTransacaoOriginal: JString; cdecl;//Deprecated
    {class} function obtemNumeroFatura: JString; cdecl;//Deprecated
    {class} function obtemNumeroParcelas: Integer; cdecl;//Deprecated
    {class} function obtemNumeroTelefone: JString; cdecl;//Deprecated
    {class} function obtemOperacao: JOperacoes; cdecl;//Deprecated
    {class} function obtemProvedor: JProvedores; cdecl;//Deprecated
    {class} function obtemTaxaEmbarque: JString; cdecl;//Deprecated
    {class} function obtemTaxaServico: JString; cdecl;//Deprecated
    {class} function obtemTipoCartao: JCartoes; cdecl;//Deprecated
    {class} function obtemTipoFinanciamento: JFinanciamentos; cdecl;//Deprecated
    {class} function obtemValorTotal: JString; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/EntradaTransacao')]
  JEntradaTransacao = interface(JSerializable)
    ['{D24FBBC3-9772-4B44-934B-B3A1CEFBD3AF}']
    {class} function informaCodigoAutorizacaoOriginal(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaCodigoMoeda(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaDadosAdicionaisAutomacao1(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaDadosAdicionaisAutomacao2(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaDadosAdicionaisAutomacao3(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaDadosAdicionaisAutomacao4(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaDataHoraTransacaoOriginal(P1: JDate): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaDataPredatado(P1: JDate): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaDocumentoFiscal(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaEstabelecimentoCNPJouCPF(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaModalidadePagamento(P1: JModalidadesPagamento): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaNomeProvedor(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaNsuTransacaoOriginal(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaNumeroFatura(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaNumeroParcelas(P1: Integer): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaNumeroTelefone(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaProvedor(P1: JProvedores): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaTaxaEmbarque(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaTaxaServico(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaTipoCartao(P1: JCartoes): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaTipoFinanciamento(P1: JFinanciamentos): JEntradaTransacao; cdecl;//Deprecated
    {class} function informaValorTotal(P1: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function init(P1: JOperacoes; P2: JString): JEntradaTransacao; cdecl;//Deprecated
    {class} function obtemCodigoAutorizacaoOriginal: JString; cdecl;//Deprecated
    {class} function obtemCodigoMoeda: JString; cdecl;//Deprecated
    {class} function obtemDadosAdicionaisAutomacao1: JString; cdecl;//Deprecated
    {class} function obtemDadosAdicionaisAutomacao2: JString; cdecl;//Deprecated
    {class} function obtemDadosAdicionaisAutomacao3: JString; cdecl;//Deprecated
    {class} function obtemDadosAdicionaisAutomacao4: JString; cdecl;//Deprecated
    {class} function obtemDataHoraTransacaoOriginal: JDate; cdecl;//Deprecated
    {class} function obtemDataPredatado: JDate; cdecl;//Deprecated
    {class} function obtemDocumentoFiscal: JString; cdecl;//Deprecated
    {class} function obtemEstabelecimentoCNPJouCPF: JString; cdecl;//Deprecated
    {class} function obtemIdTransacaoAutomacao: JString; cdecl;//Deprecated
    {class} function obtemModalidadePagamento: JModalidadesPagamento; cdecl;//Deprecated
    {class} function obtemNomeProvedor: JString; cdecl;//Deprecated
    {class} function obtemNsuTransacaoOriginal: JString; cdecl;//Deprecated
    {class} function obtemNumeroFatura: JString; cdecl;//Deprecated
    {class} function obtemNumeroParcelas: Integer; cdecl;//Deprecated
    {class} function obtemNumeroTelefone: JString; cdecl;//Deprecated
    {class} function obtemOperacao: JOperacoes; cdecl;//Deprecated
    {class} function obtemProvedor: JProvedores; cdecl;//Deprecated
    {class} function obtemTaxaEmbarque: JString; cdecl;//Deprecated
    {class} function obtemTaxaServico: JString; cdecl;//Deprecated
    {class} function obtemTipoCartao: JCartoes; cdecl;//Deprecated
    {class} function obtemTipoFinanciamento: JFinanciamentos; cdecl;//Deprecated
    {class} function obtemValorTotal: JString; cdecl;//Deprecated
  end;
  TJEntradaTransacao = class(TJavaGenericImport<JEntradaTransacaoClass, JEntradaTransacao>) end;

  JFinanciamentosClass = interface(JEnumClass)
    ['{BF630EEC-901B-457A-8C3A-024308289613}']
    {class} function _GetA_VISTA: JFinanciamentos; cdecl;
    {class} function _GetFINANCIAMENTO_NAO_DEFINIDO: JFinanciamentos; cdecl;
    {class} function _GetPARCELADO_EMISSOR: JFinanciamentos; cdecl;
    {class} function _GetPARCELADO_ESTABELECIMENTO: JFinanciamentos; cdecl;
    {class} function _GetPRE_DATADO: JFinanciamentos; cdecl;
    {class} function obtemCodigoFinanciamento: Integer; cdecl;//Deprecated
    {class} function obtemFinanciamento(P1: Integer): JFinanciamentos; cdecl;//Deprecated
    {class} function valueOf(P1: JString): JFinanciamentos; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JFinanciamentos>; cdecl;//Deprecated
    {class} property A_VISTA: JFinanciamentos read _GetA_VISTA;
    {class} property FINANCIAMENTO_NAO_DEFINIDO: JFinanciamentos read _GetFINANCIAMENTO_NAO_DEFINIDO;
    {class} property PARCELADO_EMISSOR: JFinanciamentos read _GetPARCELADO_EMISSOR;
    {class} property PARCELADO_ESTABELECIMENTO: JFinanciamentos read _GetPARCELADO_ESTABELECIMENTO;
    {class} property PRE_DATADO: JFinanciamentos read _GetPRE_DATADO;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Financiamentos')]
  JFinanciamentos = interface(JEnum)
    ['{5ECB4166-4E62-494A-9BB3-B4895A4B2364}']
    {class} function _GetA_VISTA: JFinanciamentos; cdecl;
    {class} function _GetFINANCIAMENTO_NAO_DEFINIDO: JFinanciamentos; cdecl;
    {class} function _GetPARCELADO_EMISSOR: JFinanciamentos; cdecl;
    {class} function _GetPARCELADO_ESTABELECIMENTO: JFinanciamentos; cdecl;
    {class} function _GetPRE_DATADO: JFinanciamentos; cdecl;
    {class} function obtemCodigoFinanciamento: Integer; cdecl;//Deprecated
    {class} function obtemFinanciamento(P1: Integer): JFinanciamentos; cdecl;//Deprecated
    {class} function valueOf(P1: JString): JFinanciamentos; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JFinanciamentos>; cdecl;//Deprecated
    {class} property A_VISTA: JFinanciamentos read _GetA_VISTA;
    {class} property FINANCIAMENTO_NAO_DEFINIDO: JFinanciamentos read _GetFINANCIAMENTO_NAO_DEFINIDO;
    {class} property PARCELADO_EMISSOR: JFinanciamentos read _GetPARCELADO_EMISSOR;
    {class} property PARCELADO_ESTABELECIMENTO: JFinanciamentos read _GetPARCELADO_ESTABELECIMENTO;
    {class} property PRE_DATADO: JFinanciamentos read _GetPRE_DATADO;
  end;
  TJFinanciamentos = class(TJavaGenericImport<JFinanciamentosClass, JFinanciamentos>) end;

  JGlobalDefsClass = interface(IJavaClass)
    ['{1EF9137A-54AD-45B5-ACB1-3E232BFEE5B6}']
    {class} function _GetCLIENTE_NAO_CONFIGURADO: Integer; cdecl;
    {class} function _GetCLIENTE_NAO_INSTALADO: Integer; cdecl;
    {class} property CLIENTE_NAO_CONFIGURADO: Integer read _GetCLIENTE_NAO_CONFIGURADO;
    {class} property CLIENTE_NAO_INSTALADO: Integer read _GetCLIENTE_NAO_INSTALADO;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/GlobalDefs')]
  JGlobalDefs = interface(IJavaInstance)
    ['{8CAE1B92-ECB7-4711-A69B-7DA28B6CD0CE}']
  end;
  TJGlobalDefs = class(TJavaGenericImport<JGlobalDefsClass, JGlobalDefs>) end;

  JModalidadesPagamentoClass = interface(JEnumClass)
    ['{A5E63ED4-06AA-4C5D-8CDA-32C6FC402B1B}']
    {class} function _GetPAGAMENTO_CARTAO: JModalidadesPagamento; cdecl;
    {class} function _GetPAGAMENTO_CHEQUE: JModalidadesPagamento; cdecl;
    {class} function _GetPAGAMENTO_DINHEIRO: JModalidadesPagamento; cdecl;
    {class} function valueOf(P1: JString): JModalidadesPagamento; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JModalidadesPagamento>; cdecl;//Deprecated
    {class} property PAGAMENTO_CARTAO: JModalidadesPagamento read _GetPAGAMENTO_CARTAO;
    {class} property PAGAMENTO_CHEQUE: JModalidadesPagamento read _GetPAGAMENTO_CHEQUE;
    {class} property PAGAMENTO_DINHEIRO: JModalidadesPagamento read _GetPAGAMENTO_DINHEIRO;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/ModalidadesPagamento')]
  JModalidadesPagamento = interface(JEnum)
    ['{286573DE-3452-4152-B778-CEBC2047F1A9}']
    {class} function _GetPAGAMENTO_CARTAO: JModalidadesPagamento; cdecl;
    {class} function _GetPAGAMENTO_CHEQUE: JModalidadesPagamento; cdecl;
    {class} function _GetPAGAMENTO_DINHEIRO: JModalidadesPagamento; cdecl;
    {class} function valueOf(P1: JString): JModalidadesPagamento; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JModalidadesPagamento>; cdecl;//Deprecated
    {class} property PAGAMENTO_CARTAO: JModalidadesPagamento read _GetPAGAMENTO_CARTAO;
    {class} property PAGAMENTO_CHEQUE: JModalidadesPagamento read _GetPAGAMENTO_CHEQUE;
    {class} property PAGAMENTO_DINHEIRO: JModalidadesPagamento read _GetPAGAMENTO_DINHEIRO;
  end;
  TJModalidadesPagamento = class(TJavaGenericImport<JModalidadesPagamentoClass, JModalidadesPagamento>) end;

  JOperacoesClass = interface(JEnumClass)
    ['{51EF02F8-CAF1-4CAA-B41A-6C7D5D2BA658}']
    {class} function _GetADMINISTRATIVA: JOperacoes; cdecl;
    {class} function _GetCANCELAMENTO: JOperacoes; cdecl;
    {class} function _GetCANCELAMENTO_PAGAMENTOCONTA: JOperacoes; cdecl;
    {class} function _GetCANCELAMENTO_PREAUTORIZACAO: JOperacoes; cdecl;
    {class} function _GetCONSULTA_CHEQUE: JOperacoes; cdecl;
    {class} function _GetCONSULTA_SALDO: JOperacoes; cdecl;
    {class} function _GetDOACAO: JOperacoes; cdecl;
    {class} function _GetFECHAMENTO: JOperacoes; cdecl;
    {class} function _GetGARANTIA_CHEQUE: JOperacoes; cdecl;
    {class} function _GetOPERACAO_DESCONHECIDA: JOperacoes; cdecl;
    {class} function _GetPAGAMENTO_CONTA: JOperacoes; cdecl;
    {class} function _GetPREAUTORIZACAO: JOperacoes; cdecl;
    {class} function _GetRECARGA_CELULAR: JOperacoes; cdecl;
    {class} function _GetSAQUE: JOperacoes; cdecl;
    {class} function _GetVENDA: JOperacoes; cdecl;
    {class} function obtemOperacao(P1: Integer): JOperacoes; cdecl;//Deprecated
    {class} function obtemTagOperacao: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: JString): JOperacoes; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JOperacoes>; cdecl;//Deprecated
    {class} property ADMINISTRATIVA: JOperacoes read _GetADMINISTRATIVA;
    {class} property CANCELAMENTO: JOperacoes read _GetCANCELAMENTO;
    {class} property CANCELAMENTO_PAGAMENTOCONTA: JOperacoes read _GetCANCELAMENTO_PAGAMENTOCONTA;
    {class} property CANCELAMENTO_PREAUTORIZACAO: JOperacoes read _GetCANCELAMENTO_PREAUTORIZACAO;
    {class} property CONSULTA_CHEQUE: JOperacoes read _GetCONSULTA_CHEQUE;
    {class} property CONSULTA_SALDO: JOperacoes read _GetCONSULTA_SALDO;
    {class} property DOACAO: JOperacoes read _GetDOACAO;
    {class} property FECHAMENTO: JOperacoes read _GetFECHAMENTO;
    {class} property GARANTIA_CHEQUE: JOperacoes read _GetGARANTIA_CHEQUE;
    {class} property OPERACAO_DESCONHECIDA: JOperacoes read _GetOPERACAO_DESCONHECIDA;
    {class} property PAGAMENTO_CONTA: JOperacoes read _GetPAGAMENTO_CONTA;
    {class} property PREAUTORIZACAO: JOperacoes read _GetPREAUTORIZACAO;
    {class} property RECARGA_CELULAR: JOperacoes read _GetRECARGA_CELULAR;
    {class} property SAQUE: JOperacoes read _GetSAQUE;
    {class} property VENDA: JOperacoes read _GetVENDA;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Operacoes')]
  JOperacoes = interface(JEnum)
    ['{AA004D21-1399-4E0B-95A4-3DBF498050E1}']
    {class} function _GetADMINISTRATIVA: JOperacoes; cdecl;
    {class} function _GetCANCELAMENTO: JOperacoes; cdecl;
    {class} function _GetCANCELAMENTO_PAGAMENTOCONTA: JOperacoes; cdecl;
    {class} function _GetCANCELAMENTO_PREAUTORIZACAO: JOperacoes; cdecl;
    {class} function _GetCONSULTA_CHEQUE: JOperacoes; cdecl;
    {class} function _GetCONSULTA_SALDO: JOperacoes; cdecl;
    {class} function _GetDOACAO: JOperacoes; cdecl;
    {class} function _GetFECHAMENTO: JOperacoes; cdecl;
    {class} function _GetGARANTIA_CHEQUE: JOperacoes; cdecl;
    {class} function _GetOPERACAO_DESCONHECIDA: JOperacoes; cdecl;
    {class} function _GetPAGAMENTO_CONTA: JOperacoes; cdecl;
    {class} function _GetPREAUTORIZACAO: JOperacoes; cdecl;
    {class} function _GetRECARGA_CELULAR: JOperacoes; cdecl;
    {class} function _GetSAQUE: JOperacoes; cdecl;
    {class} function _GetVENDA: JOperacoes; cdecl;
    {class} function obtemOperacao(P1: Integer): JOperacoes; cdecl;//Deprecated
    {class} function obtemTagOperacao: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: JString): JOperacoes; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JOperacoes>; cdecl;//Deprecated
    {class} property ADMINISTRATIVA: JOperacoes read _GetADMINISTRATIVA;
    {class} property CANCELAMENTO: JOperacoes read _GetCANCELAMENTO;
    {class} property CANCELAMENTO_PAGAMENTOCONTA: JOperacoes read _GetCANCELAMENTO_PAGAMENTOCONTA;
    {class} property CANCELAMENTO_PREAUTORIZACAO: JOperacoes read _GetCANCELAMENTO_PREAUTORIZACAO;
    {class} property CONSULTA_CHEQUE: JOperacoes read _GetCONSULTA_CHEQUE;
    {class} property CONSULTA_SALDO: JOperacoes read _GetCONSULTA_SALDO;
    {class} property DOACAO: JOperacoes read _GetDOACAO;
    {class} property FECHAMENTO: JOperacoes read _GetFECHAMENTO;
    {class} property GARANTIA_CHEQUE: JOperacoes read _GetGARANTIA_CHEQUE;
    {class} property OPERACAO_DESCONHECIDA: JOperacoes read _GetOPERACAO_DESCONHECIDA;
    {class} property PAGAMENTO_CONTA: JOperacoes read _GetPAGAMENTO_CONTA;
    {class} property PREAUTORIZACAO: JOperacoes read _GetPREAUTORIZACAO;
    {class} property RECARGA_CELULAR: JOperacoes read _GetRECARGA_CELULAR;
    {class} property SAQUE: JOperacoes read _GetSAQUE;
    {class} property VENDA: JOperacoes read _GetVENDA;
  end;
  TJOperacoes = class(TJavaGenericImport<JOperacoesClass, JOperacoes>) end;

  JPersonalizacaoClass = interface(JSerializableClass)
    ['{2DC2C3CA-A077-4B3B-8C5A-3E2452EF00B7}']
    {class} function obtemCorFonte: JString; cdecl;//Deprecated
    {class} function obtemCorFonteTeclado: JString; cdecl;//Deprecated
    {class} function obtemCorFundoCaixaEdicao: JString; cdecl;//Deprecated
    {class} function obtemCorFundoTeclado: JString; cdecl;//Deprecated
    {class} function obtemCorFundoTela: JString; cdecl;//Deprecated
    {class} function obtemCorFundoToolbar: JString; cdecl;//Deprecated
    {class} function obtemCorSeparadorMenu: JString; cdecl;//Deprecated
    {class} function obtemCorTeclaLiberadaTeclado: JString; cdecl;//Deprecated
    {class} function obtemCorTeclaPressionadaTeclado: JString; cdecl;//Deprecated
    {class} function obtemCorTextoCaixaEdicao: JString; cdecl;//Deprecated
    {class} function obtemIconeToolbar: JFile; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Personalizacao')]
  JPersonalizacao = interface(JSerializable)
    ['{93E28FC5-A1DE-4F29-8ED8-0F1362B89193}']
    {class} function obtemCorFonte: JString; cdecl;//Deprecated
    {class} function obtemCorFonteTeclado: JString; cdecl;//Deprecated
    {class} function obtemCorFundoCaixaEdicao: JString; cdecl;//Deprecated
    {class} function obtemCorFundoTeclado: JString; cdecl;//Deprecated
    {class} function obtemCorFundoTela: JString; cdecl;//Deprecated
    {class} function obtemCorFundoToolbar: JString; cdecl;//Deprecated
    {class} function obtemCorSeparadorMenu: JString; cdecl;//Deprecated
    {class} function obtemCorTeclaLiberadaTeclado: JString; cdecl;//Deprecated
    {class} function obtemCorTeclaPressionadaTeclado: JString; cdecl;//Deprecated
    {class} function obtemCorTextoCaixaEdicao: JString; cdecl;//Deprecated
    {class} function obtemIconeToolbar: JFile; cdecl;//Deprecated
  end;
  TJPersonalizacao = class(TJavaGenericImport<JPersonalizacaoClass, JPersonalizacao>) end;

  JPersonalizacao_1Class = interface(JObjectClass)
    ['{4919E93A-DBA7-4392-A7AC-01B831FD29E1}']
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Personalizacao$1')]
  JPersonalizacao_1 = interface(JObject)
    ['{3E643B93-C182-46E2-A9CC-9CE025E5806F}']
  end;
  TJPersonalizacao_1 = class(TJavaGenericImport<JPersonalizacao_1Class, JPersonalizacao_1>) end;

  JPersonalizacao_BuilderClass = interface(JObjectClass)
    ['{57846963-0089-45D6-BDBB-29E55B9474A1}']
    {class} function build: JPersonalizacao; cdecl;//Deprecated
    {class} function informaCorFonte(P1: JString): JPersonalizacao_Builder; cdecl;//Deprecated
    {class} function informaCorFonteTeclado(P1: JString): JPersonalizacao_Builder; cdecl;//Deprecated
    {class} function informaCorFundoCaixaEdicao(P1: JString): JPersonalizacao_Builder; cdecl;//Deprecated
    {class} function informaCorFundoTeclado(P1: JString): JPersonalizacao_Builder; cdecl;//Deprecated
    {class} function informaCorFundoTela(P1: JString): JPersonalizacao_Builder; cdecl;//Deprecated
    {class} function informaCorFundoToolbar(P1: JString): JPersonalizacao_Builder; cdecl;//Deprecated
    {class} function informaCorSeparadorMenu(P1: JString): JPersonalizacao_Builder; cdecl;//Deprecated
    {class} function informaCorTeclaLiberadaTeclado(P1: JString): JPersonalizacao_Builder; cdecl;//Deprecated
    {class} function informaCorTeclaPressionadaTeclado(P1: JString): JPersonalizacao_Builder; cdecl;//Deprecated
    {class} function informaCorTextoCaixaEdicao(P1: JString): JPersonalizacao_Builder; cdecl;//Deprecated
    {class} function informaIconeToolbar(P1: JFile): JPersonalizacao_Builder; cdecl;//Deprecated
    {class} function init: JPersonalizacao_Builder; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Personalizacao$Builder')]
  JPersonalizacao_Builder = interface(JObject)
    ['{D517F76F-DEA3-468B-989E-C0A0ED13283A}']
    {class} function build: JPersonalizacao; cdecl;//Deprecated
    {class} function informaCorFonte(P1: JString): JPersonalizacao_Builder; cdecl;//Deprecated
    {class} function informaCorFonteTeclado(P1: JString): JPersonalizacao_Builder; cdecl;//Deprecated
    {class} function informaCorFundoCaixaEdicao(P1: JString): JPersonalizacao_Builder; cdecl;//Deprecated
    {class} function informaCorFundoTeclado(P1: JString): JPersonalizacao_Builder; cdecl;//Deprecated
    {class} function informaCorFundoTela(P1: JString): JPersonalizacao_Builder; cdecl;//Deprecated
    {class} function informaCorFundoToolbar(P1: JString): JPersonalizacao_Builder; cdecl;//Deprecated
    {class} function informaCorSeparadorMenu(P1: JString): JPersonalizacao_Builder; cdecl;//Deprecated
    {class} function informaCorTeclaLiberadaTeclado(P1: JString): JPersonalizacao_Builder; cdecl;//Deprecated
    {class} function informaCorTeclaPressionadaTeclado(P1: JString): JPersonalizacao_Builder; cdecl;//Deprecated
    {class} function informaCorTextoCaixaEdicao(P1: JString): JPersonalizacao_Builder; cdecl;//Deprecated
    {class} function informaIconeToolbar(P1: JFile): JPersonalizacao_Builder; cdecl;//Deprecated
    {class} function init: JPersonalizacao_Builder; cdecl;//Deprecated
  end;
  TJPersonalizacao_Builder = class(TJavaGenericImport<JPersonalizacao_BuilderClass, JPersonalizacao_Builder>) end;

  JProvedoresClass = interface(JEnumClass)
    ['{5933546F-6EE2-429D-841F-B2A929B6D44C}']
    {class} function _GetACCORD: JProvedores; cdecl;
    {class} function _GetALGORIX: JProvedores; cdecl;
    {class} function _GetAMEX: JProvedores; cdecl;
    {class} function _GetBANCREDCARD: JProvedores; cdecl;
    {class} function _GetBANESE: JProvedores; cdecl;
    {class} function _GetBANRISUL: JProvedores; cdecl;
    {class} function _GetCIELO: JProvedores; cdecl;
    {class} function _GetCONDUCTOR: JProvedores; cdecl;
    {class} function _GetCOOPERCRED: JProvedores; cdecl;
    {class} function _GetCREDISHOP: JProvedores; cdecl;
    {class} function _GetELAVON: JProvedores; cdecl;
    {class} function _GetFANCARD: JProvedores; cdecl;
    {class} function _GetFILLIP: JProvedores; cdecl;
    {class} function _GetFIRSTDATA: JProvedores; cdecl;
    {class} function _GetGETNET: JProvedores; cdecl;
    {class} function _GetHIPERCARD: JProvedores; cdecl;
    {class} function _GetLIBERCARD: JProvedores; cdecl;
    {class} function _GetM4U: JProvedores; cdecl;
    {class} function _GetMUXX: JProvedores; cdecl;
    {class} function _GetNEUS: JProvedores; cdecl;
    {class} function _GetORGCARD: JProvedores; cdecl;
    {class} function _GetPOLICARD: JProvedores; cdecl;
    {class} function _GetPREMMIA: JProvedores; cdecl;
    {class} function _GetPREPAG: JProvedores; cdecl;
    {class} function _GetPROVEDOR_DESCONHECIDO: JProvedores; cdecl;
    {class} function _GetREDECARD: JProvedores; cdecl;
    {class} function _GetREPOM: JProvedores; cdecl;
    {class} function _GetRV: JProvedores; cdecl;
    {class} function _GetSENFF: JProvedores; cdecl;
    {class} function _GetTECPOINT: JProvedores; cdecl;
    {class} function _GetTICKETCAR: JProvedores; cdecl;
    {class} function _GetTRICARD: JProvedores; cdecl;
    {class} function _GetVALECARD: JProvedores; cdecl;
    {class} function _GetVERYCARD: JProvedores; cdecl;
    {class} function obtemProvedor(P1: JString): JProvedores; cdecl;//Deprecated
    {class} function valueOf(P1: JString): JProvedores; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JProvedores>; cdecl;//Deprecated
    {class} property ACCORD: JProvedores read _GetACCORD;
    {class} property ALGORIX: JProvedores read _GetALGORIX;
    {class} property AMEX: JProvedores read _GetAMEX;
    {class} property BANCREDCARD: JProvedores read _GetBANCREDCARD;
    {class} property BANESE: JProvedores read _GetBANESE;
    {class} property BANRISUL: JProvedores read _GetBANRISUL;
    {class} property CIELO: JProvedores read _GetCIELO;
    {class} property CONDUCTOR: JProvedores read _GetCONDUCTOR;
    {class} property COOPERCRED: JProvedores read _GetCOOPERCRED;
    {class} property CREDISHOP: JProvedores read _GetCREDISHOP;
    {class} property ELAVON: JProvedores read _GetELAVON;
    {class} property FANCARD: JProvedores read _GetFANCARD;
    {class} property FILLIP: JProvedores read _GetFILLIP;
    {class} property FIRSTDATA: JProvedores read _GetFIRSTDATA;
    {class} property GETNET: JProvedores read _GetGETNET;
    {class} property HIPERCARD: JProvedores read _GetHIPERCARD;
    {class} property LIBERCARD: JProvedores read _GetLIBERCARD;
    {class} property M4U: JProvedores read _GetM4U;
    {class} property MUXX: JProvedores read _GetMUXX;
    {class} property NEUS: JProvedores read _GetNEUS;
    {class} property ORGCARD: JProvedores read _GetORGCARD;
    {class} property POLICARD: JProvedores read _GetPOLICARD;
    {class} property PREMMIA: JProvedores read _GetPREMMIA;
    {class} property PREPAG: JProvedores read _GetPREPAG;
    {class} property PROVEDOR_DESCONHECIDO: JProvedores read _GetPROVEDOR_DESCONHECIDO;
    {class} property REDECARD: JProvedores read _GetREDECARD;
    {class} property REPOM: JProvedores read _GetREPOM;
    {class} property RV: JProvedores read _GetRV;
    {class} property SENFF: JProvedores read _GetSENFF;
    {class} property TECPOINT: JProvedores read _GetTECPOINT;
    {class} property TICKETCAR: JProvedores read _GetTICKETCAR;
    {class} property TRICARD: JProvedores read _GetTRICARD;
    {class} property VALECARD: JProvedores read _GetVALECARD;
    {class} property VERYCARD: JProvedores read _GetVERYCARD;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Provedores')]
  JProvedores = interface(JEnum)
    ['{57E11FCA-6D39-4FCA-AAE8-503160945A1B}']
    {class} function _GetACCORD: JProvedores; cdecl;
    {class} function _GetALGORIX: JProvedores; cdecl;
    {class} function _GetAMEX: JProvedores; cdecl;
    {class} function _GetBANCREDCARD: JProvedores; cdecl;
    {class} function _GetBANESE: JProvedores; cdecl;
    {class} function _GetBANRISUL: JProvedores; cdecl;
    {class} function _GetCIELO: JProvedores; cdecl;
    {class} function _GetCONDUCTOR: JProvedores; cdecl;
    {class} function _GetCOOPERCRED: JProvedores; cdecl;
    {class} function _GetCREDISHOP: JProvedores; cdecl;
    {class} function _GetELAVON: JProvedores; cdecl;
    {class} function _GetFANCARD: JProvedores; cdecl;
    {class} function _GetFILLIP: JProvedores; cdecl;
    {class} function _GetFIRSTDATA: JProvedores; cdecl;
    {class} function _GetGETNET: JProvedores; cdecl;
    {class} function _GetHIPERCARD: JProvedores; cdecl;
    {class} function _GetLIBERCARD: JProvedores; cdecl;
    {class} function _GetM4U: JProvedores; cdecl;
    {class} function _GetMUXX: JProvedores; cdecl;
    {class} function _GetNEUS: JProvedores; cdecl;
    {class} function _GetORGCARD: JProvedores; cdecl;
    {class} function _GetPOLICARD: JProvedores; cdecl;
    {class} function _GetPREMMIA: JProvedores; cdecl;
    {class} function _GetPREPAG: JProvedores; cdecl;
    {class} function _GetPROVEDOR_DESCONHECIDO: JProvedores; cdecl;
    {class} function _GetREDECARD: JProvedores; cdecl;
    {class} function _GetREPOM: JProvedores; cdecl;
    {class} function _GetRV: JProvedores; cdecl;
    {class} function _GetSENFF: JProvedores; cdecl;
    {class} function _GetTECPOINT: JProvedores; cdecl;
    {class} function _GetTICKETCAR: JProvedores; cdecl;
    {class} function _GetTRICARD: JProvedores; cdecl;
    {class} function _GetVALECARD: JProvedores; cdecl;
    {class} function _GetVERYCARD: JProvedores; cdecl;
    {class} function obtemProvedor(P1: JString): JProvedores; cdecl;//Deprecated
    {class} function valueOf(P1: JString): JProvedores; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JProvedores>; cdecl;//Deprecated
    {class} property ACCORD: JProvedores read _GetACCORD;
    {class} property ALGORIX: JProvedores read _GetALGORIX;
    {class} property AMEX: JProvedores read _GetAMEX;
    {class} property BANCREDCARD: JProvedores read _GetBANCREDCARD;
    {class} property BANESE: JProvedores read _GetBANESE;
    {class} property BANRISUL: JProvedores read _GetBANRISUL;
    {class} property CIELO: JProvedores read _GetCIELO;
    {class} property CONDUCTOR: JProvedores read _GetCONDUCTOR;
    {class} property COOPERCRED: JProvedores read _GetCOOPERCRED;
    {class} property CREDISHOP: JProvedores read _GetCREDISHOP;
    {class} property ELAVON: JProvedores read _GetELAVON;
    {class} property FANCARD: JProvedores read _GetFANCARD;
    {class} property FILLIP: JProvedores read _GetFILLIP;
    {class} property FIRSTDATA: JProvedores read _GetFIRSTDATA;
    {class} property GETNET: JProvedores read _GetGETNET;
    {class} property HIPERCARD: JProvedores read _GetHIPERCARD;
    {class} property LIBERCARD: JProvedores read _GetLIBERCARD;
    {class} property M4U: JProvedores read _GetM4U;
    {class} property MUXX: JProvedores read _GetMUXX;
    {class} property NEUS: JProvedores read _GetNEUS;
    {class} property ORGCARD: JProvedores read _GetORGCARD;
    {class} property POLICARD: JProvedores read _GetPOLICARD;
    {class} property PREMMIA: JProvedores read _GetPREMMIA;
    {class} property PREPAG: JProvedores read _GetPREPAG;
    {class} property PROVEDOR_DESCONHECIDO: JProvedores read _GetPROVEDOR_DESCONHECIDO;
    {class} property REDECARD: JProvedores read _GetREDECARD;
    {class} property REPOM: JProvedores read _GetREPOM;
    {class} property RV: JProvedores read _GetRV;
    {class} property SENFF: JProvedores read _GetSENFF;
    {class} property TECPOINT: JProvedores read _GetTECPOINT;
    {class} property TICKETCAR: JProvedores read _GetTICKETCAR;
    {class} property TRICARD: JProvedores read _GetTRICARD;
    {class} property VALECARD: JProvedores read _GetVALECARD;
    {class} property VERYCARD: JProvedores read _GetVERYCARD;
  end;
  TJProvedores = class(TJavaGenericImport<JProvedoresClass, JProvedores>) end;

  JQuedaConexaoTerminalExcecaoClass = interface(JRuntimeExceptionClass)
    ['{85109A3B-64DE-4B2D-B7CB-FC86CC7696C1}']
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/QuedaConexaoTerminalExcecao')]
  JQuedaConexaoTerminalExcecao = interface(JRuntimeException)
    ['{425C780F-0104-445F-8549-D5B9C9E82F4C}']
  end;
  TJQuedaConexaoTerminalExcecao = class(TJavaGenericImport<JQuedaConexaoTerminalExcecaoClass, JQuedaConexaoTerminalExcecao>) end;

  JSaidaTransacaoClass = interface(JSerializableClass)
    ['{D4F5C4AF-2B82-437C-B417-F2951E27052F}']
    {class} function existeTransacaoPendente: Boolean; cdecl;//Deprecated
    {class} function informaAidCartao(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaCodigoAutorizacao(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaCodigoAutorizacaoOriginal(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaCodigoMoeda(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaCodigoRespostaProvedor(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaComprovanteCompleto(P1: JList): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaComprovanteDiferenciadoLoja(P1: JList): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaComprovanteDiferenciadoPortador(P1: JList): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaComprovanteReduzidoPortador(P1: JList): JSaidaTransacao; cdecl;//Deprecated
    {class} procedure informaDadosTransacaoPendente(P1: JTransacaoPendenteDados); cdecl;//Deprecated
    {class} function informaDataHoraTransacao(P1: JDate): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaDataHoraTransacaoOriginal(P1: JDate): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaDataPredatado(P1: JDate): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaDocumentoFiscal(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} procedure informaExisteTransacaoPendente(P1: Boolean); cdecl;//Deprecated
    {class} function informaIdentificadorConfirmacaoTransacao(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaIdentificadorEstabelecimento(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaIdentificadorPontoCaptura(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaIdentificadorTransacaoAutomacao(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaMensagemResultado(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaModoEntradaCartao(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaModoVerificacaoSenha(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaNomeCartao(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaNomeCartaoPadrao(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaNomeEstabelecimento(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaNomePortadorCartao(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaNomeProvedor(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaNsuHost(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaNsuHostOriginal(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaNsuLocal(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaNsuLocalOriginal(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaNumeroParcelas(P1: Integer): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaOperacao(P1: JOperacoes): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaPanMascarado(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaPanMascaradoPadrao(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaProvedor(P1: JProvedores): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaRequerConfirmacao(P1: Boolean): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaResultadoTransacao(P1: Integer): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaSaldoVoucher(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaTipoCartao(P1: JCartoes): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaTipoFinanciamento(P1: JFinanciamentos): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaValorDesconto(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaValorOriginal(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaValorTotal(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaValorTroco(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaViasImprimir(P1: JViasImpressao): JSaidaTransacao; cdecl;//Deprecated
    {class} function init: JSaidaTransacao; cdecl;//Deprecated
    {class} function obtemAidCartao: JString; cdecl;//Deprecated
    {class} function obtemCodigoAutorizacao: JString; cdecl;//Deprecated
    {class} function obtemCodigoAutorizacaoOriginal: JString; cdecl;//Deprecated
    {class} function obtemCodigoMoeda: JString; cdecl;//Deprecated
    {class} function obtemCodigoRespostaProvedor: JString; cdecl;//Deprecated
    {class} function obtemComprovanteCompleto: JList; cdecl;//Deprecated
    {class} function obtemComprovanteDiferenciadoLoja: JList; cdecl;//Deprecated
    {class} function obtemComprovanteDiferenciadoPortador: JList; cdecl;//Deprecated
    {class} function obtemComprovanteReduzidoPortador: JList; cdecl;//Deprecated
    {class} function obtemDadosTransacaoPendente: JTransacaoPendenteDados; cdecl;//Deprecated
    {class} function obtemDataHoraTransacao: JDate; cdecl;//Deprecated
    {class} function obtemDataHoraTransacaoOriginal: JDate; cdecl;//Deprecated
    {class} function obtemDataPredatado: JDate; cdecl;//Deprecated
    {class} function obtemDocumentoFiscal: JString; cdecl;//Deprecated
    {class} function obtemIdentificadorConfirmacaoTransacao: JString; cdecl;//Deprecated
    {class} function obtemIdentificadorEstabelecimento: JString; cdecl;//Deprecated
    {class} function obtemIdentificadorPontoCaptura: JString; cdecl;//Deprecated
    {class} function obtemIdentificadorTransacaoAutomacao: JString; cdecl;//Deprecated
    {class} function obtemInformacaoConfirmacao: Boolean; cdecl;//Deprecated
    {class} function obtemMensagemResultado: JString; cdecl;//Deprecated
    {class} function obtemModoEntradaCartao: JString; cdecl;//Deprecated
    {class} function obtemModoVerificacaoSenha: JString; cdecl;//Deprecated
    {class} function obtemNomeCartao: JString; cdecl;//Deprecated
    {class} function obtemNomeCartaoPadrao: JString; cdecl;//Deprecated
    {class} function obtemNomeEstabelecimento: JString; cdecl;//Deprecated
    {class} function obtemNomePortadorCartao: JString; cdecl;//Deprecated
    {class} function obtemNomeProvedor: JString; cdecl;//Deprecated
    {class} function obtemNsuHost: JString; cdecl;//Deprecated
    {class} function obtemNsuHostOriginal: JString; cdecl;//Deprecated
    {class} function obtemNsuLocal: JString; cdecl;//Deprecated
    {class} function obtemNsuLocalOriginal: JString; cdecl;//Deprecated
    {class} function obtemNumeroParcelas: Integer; cdecl;//Deprecated
    {class} function obtemOperacao: JOperacoes; cdecl;//Deprecated
    {class} function obtemPanMascarado: JString; cdecl;//Deprecated
    {class} function obtemPanMascaradoPadrao: JString; cdecl;//Deprecated
    {class} function obtemProvedor: JProvedores; cdecl;//Deprecated
    {class} function obtemResultadoTransacao: Integer; cdecl;//Deprecated
    {class} function obtemSaldoVoucher: JString; cdecl;//Deprecated
    {class} function obtemTipoCartao: JCartoes; cdecl;//Deprecated
    {class} function obtemTipoFinanciamento: JFinanciamentos; cdecl;//Deprecated
    {class} function obtemValorDesconto: JString; cdecl;//Deprecated
    {class} function obtemValorOriginal: JString; cdecl;//Deprecated
    {class} function obtemValorTotal: JString; cdecl;//Deprecated
    {class} function obtemValorTroco: JString; cdecl;//Deprecated
    {class} function obtemViasImprimir: JViasImpressao; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/SaidaTransacao')]
  JSaidaTransacao = interface(JSerializable)
    ['{5FC8A990-D095-493F-AF78-4C91D9548A22}']
    {class} function existeTransacaoPendente: Boolean; cdecl;//Deprecated
    {class} function informaAidCartao(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaCodigoAutorizacao(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaCodigoAutorizacaoOriginal(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaCodigoMoeda(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaCodigoRespostaProvedor(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaComprovanteCompleto(P1: JList): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaComprovanteDiferenciadoLoja(P1: JList): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaComprovanteDiferenciadoPortador(P1: JList): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaComprovanteReduzidoPortador(P1: JList): JSaidaTransacao; cdecl;//Deprecated
    {class} procedure informaDadosTransacaoPendente(P1: JTransacaoPendenteDados); cdecl;//Deprecated
    {class} function informaDataHoraTransacao(P1: JDate): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaDataHoraTransacaoOriginal(P1: JDate): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaDataPredatado(P1: JDate): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaDocumentoFiscal(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} procedure informaExisteTransacaoPendente(P1: Boolean); cdecl;//Deprecated
    {class} function informaIdentificadorConfirmacaoTransacao(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaIdentificadorEstabelecimento(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaIdentificadorPontoCaptura(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaIdentificadorTransacaoAutomacao(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaMensagemResultado(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaModoEntradaCartao(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaModoVerificacaoSenha(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaNomeCartao(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaNomeCartaoPadrao(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaNomeEstabelecimento(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaNomePortadorCartao(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaNomeProvedor(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaNsuHost(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaNsuHostOriginal(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaNsuLocal(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaNsuLocalOriginal(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaNumeroParcelas(P1: Integer): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaOperacao(P1: JOperacoes): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaPanMascarado(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaPanMascaradoPadrao(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaProvedor(P1: JProvedores): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaRequerConfirmacao(P1: Boolean): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaResultadoTransacao(P1: Integer): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaSaldoVoucher(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaTipoCartao(P1: JCartoes): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaTipoFinanciamento(P1: JFinanciamentos): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaValorDesconto(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaValorOriginal(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaValorTotal(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaValorTroco(P1: JString): JSaidaTransacao; cdecl;//Deprecated
    {class} function informaViasImprimir(P1: JViasImpressao): JSaidaTransacao; cdecl;//Deprecated
    {class} function init: JSaidaTransacao; cdecl;//Deprecated
    {class} function obtemAidCartao: JString; cdecl;//Deprecated
    {class} function obtemCodigoAutorizacao: JString; cdecl;//Deprecated
    {class} function obtemCodigoAutorizacaoOriginal: JString; cdecl;//Deprecated
    {class} function obtemCodigoMoeda: JString; cdecl;//Deprecated
    {class} function obtemCodigoRespostaProvedor: JString; cdecl;//Deprecated
    {class} function obtemComprovanteCompleto: JList; cdecl;//Deprecated
    {class} function obtemComprovanteDiferenciadoLoja: JList; cdecl;//Deprecated
    {class} function obtemComprovanteDiferenciadoPortador: JList; cdecl;//Deprecated
    {class} function obtemComprovanteReduzidoPortador: JList; cdecl;//Deprecated
    {class} function obtemDadosTransacaoPendente: JTransacaoPendenteDados; cdecl;//Deprecated
    {class} function obtemDataHoraTransacao: JDate; cdecl;//Deprecated
    {class} function obtemDataHoraTransacaoOriginal: JDate; cdecl;//Deprecated
    {class} function obtemDataPredatado: JDate; cdecl;//Deprecated
    {class} function obtemDocumentoFiscal: JString; cdecl;//Deprecated
    {class} function obtemIdentificadorConfirmacaoTransacao: JString; cdecl;//Deprecated
    {class} function obtemIdentificadorEstabelecimento: JString; cdecl;//Deprecated
    {class} function obtemIdentificadorPontoCaptura: JString; cdecl;//Deprecated
    {class} function obtemIdentificadorTransacaoAutomacao: JString; cdecl;//Deprecated
    {class} function obtemInformacaoConfirmacao: Boolean; cdecl;//Deprecated
    {class} function obtemMensagemResultado: JString; cdecl;//Deprecated
    {class} function obtemModoEntradaCartao: JString; cdecl;//Deprecated
    {class} function obtemModoVerificacaoSenha: JString; cdecl;//Deprecated
    {class} function obtemNomeCartao: JString; cdecl;//Deprecated
    {class} function obtemNomeCartaoPadrao: JString; cdecl;//Deprecated
    {class} function obtemNomeEstabelecimento: JString; cdecl;//Deprecated
    {class} function obtemNomePortadorCartao: JString; cdecl;//Deprecated
    {class} function obtemNomeProvedor: JString; cdecl;//Deprecated
    {class} function obtemNsuHost: JString; cdecl;//Deprecated
    {class} function obtemNsuHostOriginal: JString; cdecl;//Deprecated
    {class} function obtemNsuLocal: JString; cdecl;//Deprecated
    {class} function obtemNsuLocalOriginal: JString; cdecl;//Deprecated
    {class} function obtemNumeroParcelas: Integer; cdecl;//Deprecated
    {class} function obtemOperacao: JOperacoes; cdecl;//Deprecated
    {class} function obtemPanMascarado: JString; cdecl;//Deprecated
    {class} function obtemPanMascaradoPadrao: JString; cdecl;//Deprecated
    {class} function obtemProvedor: JProvedores; cdecl;//Deprecated
    {class} function obtemResultadoTransacao: Integer; cdecl;//Deprecated
    {class} function obtemSaldoVoucher: JString; cdecl;//Deprecated
    {class} function obtemTipoCartao: JCartoes; cdecl;//Deprecated
    {class} function obtemTipoFinanciamento: JFinanciamentos; cdecl;//Deprecated
    {class} function obtemValorDesconto: JString; cdecl;//Deprecated
    {class} function obtemValorOriginal: JString; cdecl;//Deprecated
    {class} function obtemValorTotal: JString; cdecl;//Deprecated
    {class} function obtemValorTroco: JString; cdecl;//Deprecated
    {class} function obtemViasImprimir: JViasImpressao; cdecl;//Deprecated
  end;
  TJSaidaTransacao = class(TJavaGenericImport<JSaidaTransacaoClass, JSaidaTransacao>) end;

  JSenderActivityClass = interface(JActivityClass)
    ['{54DD47AE-BE9F-4B41-9139-1B2E3DFF8771}']
    {class} function init: JSenderActivity; cdecl;//Deprecated
    {class} function obtemDadosTransacao: JSaidaTransacao; cdecl;//Deprecated
    {class} function obtemVersoes: JVersoes; cdecl;//Deprecated
    {class} function saidaDisponivel: Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/SenderActivity')]
  JSenderActivity = interface(JActivity)
    ['{51C2CCF3-6081-4951-B683-1A4932D6EBE4}']
    {class} function init: JSenderActivity; cdecl;//Deprecated
    {class} function obtemDadosTransacao: JSaidaTransacao; cdecl;//Deprecated
    {class} function obtemVersoes: JVersoes; cdecl;//Deprecated
    {class} function saidaDisponivel: Boolean; cdecl;//Deprecated
  end;
  TJSenderActivity = class(TJavaGenericImport<JSenderActivityClass, JSenderActivity>) end;

  JStatusTransacaoClass = interface(JEnumClass)
    ['{69F947B4-34E1-46C3-BB78-D9A44EEA5C70}']
    {class} function _GetCONFIRMADO_AUTOMATICO: JStatusTransacao; cdecl;
    {class} function _GetCONFIRMADO_MANUAL: JStatusTransacao; cdecl;
    {class} function _GetDESFEITO_ERRO_IMPRESSAO_AUTOMATICO: JStatusTransacao; cdecl;
    {class} function _GetDESFEITO_LIBERACAO_MERCADORIA: JStatusTransacao; cdecl;
    {class} function _GetDESFEITO_MANUAL: JStatusTransacao; cdecl;
    {class} function _GetSTATUS_TRANSACAO_NAO_DEFINIDO: JStatusTransacao; cdecl;
    {class} function valueOf(P1: JString): JStatusTransacao; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JStatusTransacao>; cdecl;//Deprecated
    {class} property CONFIRMADO_AUTOMATICO: JStatusTransacao read _GetCONFIRMADO_AUTOMATICO;
    {class} property CONFIRMADO_MANUAL: JStatusTransacao read _GetCONFIRMADO_MANUAL;
    {class} property DESFEITO_ERRO_IMPRESSAO_AUTOMATICO: JStatusTransacao read _GetDESFEITO_ERRO_IMPRESSAO_AUTOMATICO;
    {class} property DESFEITO_LIBERACAO_MERCADORIA: JStatusTransacao read _GetDESFEITO_LIBERACAO_MERCADORIA;
    {class} property DESFEITO_MANUAL: JStatusTransacao read _GetDESFEITO_MANUAL;
    {class} property STATUS_TRANSACAO_NAO_DEFINIDO: JStatusTransacao read _GetSTATUS_TRANSACAO_NAO_DEFINIDO;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/StatusTransacao')]
  JStatusTransacao = interface(JEnum)
    ['{84AD2C5B-70D5-4165-9AC6-8D94E46D66E5}']
  end;
  TJStatusTransacao = class(TJavaGenericImport<JStatusTransacaoClass, JStatusTransacao>) end;

  JTerminalClass = interface(JObjectClass)
    ['{D0DA1006-DCC5-483C-BC3F-C2841969CFAB}']
    {class} function init: JTerminal; cdecl;//Deprecated
    {class} function obtemEnderecoMAC: JString; cdecl;//Deprecated
    {class} function obtemModeloTerminal: JString; cdecl;//Deprecated
    {class} function obtemNumeroSerie: JString; cdecl;//Deprecated
    {class} function obtemVersaoAplicacaoTerminal: JString; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Terminal')]
  JTerminal = interface(JObject)
    ['{4AE23097-B74B-427B-B262-0345DE640721}']
  end;
  TJTerminal = class(TJavaGenericImport<JTerminalClass, JTerminal>) end;

  JTerminalDesconectadoExcecaoClass = interface(JExceptionClass)
    ['{E68801C5-8A65-4D29-9B50-C160274556C3}']
    {class} function init: JTerminalDesconectadoExcecao; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/TerminalDesconectadoExcecao')]
  JTerminalDesconectadoExcecao = interface(JException)
    ['{009E8650-B9BC-4F58-8C33-7944EB8347E8}']
  end;
  TJTerminalDesconectadoExcecao = class(TJavaGenericImport<JTerminalDesconectadoExcecaoClass, JTerminalDesconectadoExcecao>) end;

  JTerminalNaoConfiguradoExcecaoClass = interface(JExceptionClass)
    ['{C6ED5E6A-A5F5-4627-801C-325D6561280B}']
    {class} function init: JTerminalNaoConfiguradoExcecao; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/TerminalNaoConfiguradoExcecao')]
  JTerminalNaoConfiguradoExcecao = interface(JException)
    ['{6668EF00-2E71-45A3-80EF-C61AC2AC4788}']
    {class} function init: JTerminalNaoConfiguradoExcecao; cdecl;//Deprecated
  end;
  TJTerminalNaoConfiguradoExcecao = class(TJavaGenericImport<JTerminalNaoConfiguradoExcecaoClass, JTerminalNaoConfiguradoExcecao>) end;

  JTransacaoClass = interface(IJavaClass)
    ['{601687C4-80BF-4F87-A212-9E531D552B6B}']
    {class} procedure confirmaTransacao(P1: JConfirmacao); cdecl;//Deprecated
    {class} function realizaTransacao(P1: JEntradaTransacao): JSaidaTransacao; cdecl;//Deprecated
    {class} procedure resolvePendencia(P1: JTransacaoPendenteDados; P2: JConfirmacao); cdecl;//Deprecated
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Transacao')]
  JTransacao = interface(IJavaInstance)
    ['{42D7F732-9378-421A-AC01-434900F53707}']
  end;
  TJTransacao = class(TJavaGenericImport<JTransacaoClass, JTransacao>) end;

  JTransacaoPendenteDadosClass = interface(JSerializableClass)
    ['{3655EB92-B16D-431C-B9AC-CF440EB69480}']
    {class} procedure informaIdentificadorEstabelecimento(P1: JString); cdecl;//Deprecated
    {class} procedure informaNomeProvedor(P1: JString); cdecl;//Deprecated
    {class} procedure informaNsuHost(P1: JString); cdecl;//Deprecated
    {class} procedure informaNsuLocal(P1: JString); cdecl;//Deprecated
    {class} procedure informaNsuTransacao(P1: JString); cdecl;//Deprecated
    {class} procedure informaProvedor(P1: JProvedores); cdecl;//Deprecated
    {class} function init: JTransacaoPendenteDados; cdecl;//Deprecated
    {class} function obtemIdentificadorEstabelecimento: JString; cdecl;//Deprecated
    {class} function obtemNomeProvedor: JString; cdecl;//Deprecated
    {class} function obtemNsuHost: JString; cdecl;//Deprecated
    {class} function obtemNsuLocal: JString; cdecl;//Deprecated
    {class} function obtemNsuTransacao: JString; cdecl;//Deprecated
    {class} function obtemProvedor: JProvedores; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/TransacaoPendenteDados')]
  JTransacaoPendenteDados = interface(JSerializable)
    ['{5F8E3669-187E-4E8B-BEB1-B328C86A5778}']
  end;
  TJTransacaoPendenteDados = class(TJavaGenericImport<JTransacaoPendenteDadosClass, JTransacaoPendenteDados>) end;

  JTransacoesClass = interface(JTransacaoClass)
    ['{F401AD9B-F646-478B-835B-D65E52D07BD7}']
    {class} procedure confirmaTransacao(P1: JConfirmacao); cdecl;//Deprecated
    {class} function obtemInstancia(P1: JDadosAutomacao; P2: JContext): JTransacoes; cdecl;//Deprecated
    {class} function obtemVersoes: JVersoes; cdecl;//Deprecated
    {class} function realizaTransacao(P1: JEntradaTransacao): JSaidaTransacao; cdecl;//Deprecated
    {class} procedure resolvePendencia(P1: JTransacaoPendenteDados; P2: JConfirmacao); cdecl;//Deprecated
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Transacoes')]
  JTransacoes = interface(JTransacao)
    ['{444FDFA3-000F-4A5F-BF04-69E26664AA0E}']
    {class} procedure confirmaTransacao(P1: JConfirmacao); cdecl;//Deprecated
    {class} function obtemInstancia(P1: JDadosAutomacao; P2: JContext): JTransacoes; cdecl;//Deprecated
    {class} function obtemVersoes: JVersoes; cdecl;//Deprecated
    {class} function realizaTransacao(P1: JEntradaTransacao): JSaidaTransacao; cdecl;//Deprecated
    {class} procedure resolvePendencia(P1: JTransacaoPendenteDados; P2: JConfirmacao); cdecl;//Deprecated
  end;
  TJTransacoes = class(TJavaGenericImport<JTransacoesClass, JTransacoes>) end;

  JVersoesClass = interface(JObjectClass)
    ['{8ACC3D3A-2DD9-4DBA-937F-9CCD5AF8CB50}']
    {class} function obtemVersaoApk: JMap; cdecl;//Deprecated
    {class} function obtemVersaoBiblioteca: JString; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Versoes')]
  JVersoes = interface(JObject)
    ['{F64222A2-DBCC-44AA-84EE-BFDFB284EF4D}']
  end;
  TJVersoes = class(TJavaGenericImport<JVersoesClass, JVersoes>) end;

  JViasImpressaoClass = interface(JEnumClass)
    ['{7702EA1A-AA3B-4FCF-BB3C-A97E96F58490}']
    {class} function _GetVIA_CLIENTE: JViasImpressao; cdecl;
    {class} function _GetVIA_CLIENTE_E_ESTABELECIMENTO: JViasImpressao; cdecl;
    {class} function _GetVIA_ESTABELECIMENTO: JViasImpressao; cdecl;
    {class} function _GetVIA_NENHUMA: JViasImpressao; cdecl;
    {class} function obtemTipoViaImpressao: Integer; cdecl;//Deprecated
    {class} function obtemViaImpressao(P1: Integer): JViasImpressao; cdecl;//Deprecated
    {class} function valueOf(P1: JString): JViasImpressao; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JViasImpressao>; cdecl;//Deprecated
    {class} property VIA_CLIENTE: JViasImpressao read _GetVIA_CLIENTE;
    {class} property VIA_CLIENTE_E_ESTABELECIMENTO: JViasImpressao read _GetVIA_CLIENTE_E_ESTABELECIMENTO;
    {class} property VIA_ESTABELECIMENTO: JViasImpressao read _GetVIA_ESTABELECIMENTO;
    {class} property VIA_NENHUMA: JViasImpressao read _GetVIA_NENHUMA;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/ViasImpressao')]
  JViasImpressao = interface(JEnum)
    ['{7BDB5BA3-D3FD-4656-9803-013F5FD8A910}']
    {class} function _GetVIA_CLIENTE: JViasImpressao; cdecl;
    {class} function _GetVIA_CLIENTE_E_ESTABELECIMENTO: JViasImpressao; cdecl;
    {class} function _GetVIA_ESTABELECIMENTO: JViasImpressao; cdecl;
    {class} function _GetVIA_NENHUMA: JViasImpressao; cdecl;
    {class} function obtemTipoViaImpressao: Integer; cdecl;//Deprecated
    {class} function obtemViaImpressao(P1: Integer): JViasImpressao; cdecl;//Deprecated
    {class} function valueOf(P1: JString): JViasImpressao; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JViasImpressao>; cdecl;//Deprecated
    {class} property VIA_CLIENTE: JViasImpressao read _GetVIA_CLIENTE;
    {class} property VIA_CLIENTE_E_ESTABELECIMENTO: JViasImpressao read _GetVIA_CLIENTE_E_ESTABELECIMENTO;
    {class} property VIA_ESTABELECIMENTO: JViasImpressao read _GetVIA_ESTABELECIMENTO;
    {class} property VIA_NENHUMA: JViasImpressao read _GetVIA_NENHUMA;
  end;
  TJViasImpressao = class(TJavaGenericImport<JViasImpressaoClass, JViasImpressao>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('PayGoSDK.JAnimator', TypeInfo(PayGoSDK.JAnimator));
  TRegTypes.RegisterType('PayGoSDK.JAnimator_AnimatorListener', TypeInfo(PayGoSDK.JAnimator_AnimatorListener));
  TRegTypes.RegisterType('PayGoSDK.JAnimator_AnimatorPauseListener', TypeInfo(PayGoSDK.JAnimator_AnimatorPauseListener));
  TRegTypes.RegisterType('PayGoSDK.JKeyframe', TypeInfo(PayGoSDK.JKeyframe));
  TRegTypes.RegisterType('PayGoSDK.JLayoutTransition', TypeInfo(PayGoSDK.JLayoutTransition));
  TRegTypes.RegisterType('PayGoSDK.JLayoutTransition_TransitionListener', TypeInfo(PayGoSDK.JLayoutTransition_TransitionListener));
  TRegTypes.RegisterType('PayGoSDK.JPropertyValuesHolder', TypeInfo(PayGoSDK.JPropertyValuesHolder));
  TRegTypes.RegisterType('PayGoSDK.JStateListAnimator', TypeInfo(PayGoSDK.JStateListAnimator));
  TRegTypes.RegisterType('PayGoSDK.JTimeInterpolator', TypeInfo(PayGoSDK.JTimeInterpolator));
  TRegTypes.RegisterType('PayGoSDK.JTypeConverter', TypeInfo(PayGoSDK.JTypeConverter));
  TRegTypes.RegisterType('PayGoSDK.JTypeEvaluator', TypeInfo(PayGoSDK.JTypeEvaluator));
  TRegTypes.RegisterType('PayGoSDK.JValueAnimator', TypeInfo(PayGoSDK.JValueAnimator));
  TRegTypes.RegisterType('PayGoSDK.JValueAnimator_AnimatorUpdateListener', TypeInfo(PayGoSDK.JValueAnimator_AnimatorUpdateListener));
  TRegTypes.RegisterType('PayGoSDK.JPathMotion', TypeInfo(PayGoSDK.JPathMotion));
  TRegTypes.RegisterType('PayGoSDK.JScene', TypeInfo(PayGoSDK.JScene));
  TRegTypes.RegisterType('PayGoSDK.JTransition', TypeInfo(PayGoSDK.JTransition));
  TRegTypes.RegisterType('PayGoSDK.JTransition_EpicenterCallback', TypeInfo(PayGoSDK.JTransition_EpicenterCallback));
  TRegTypes.RegisterType('PayGoSDK.JTransition_TransitionListener', TypeInfo(PayGoSDK.JTransition_TransitionListener));
  TRegTypes.RegisterType('PayGoSDK.JTransitionManager', TypeInfo(PayGoSDK.JTransitionManager));
  TRegTypes.RegisterType('PayGoSDK.JTransitionPropagation', TypeInfo(PayGoSDK.JTransitionPropagation));
  TRegTypes.RegisterType('PayGoSDK.JTransitionValues', TypeInfo(PayGoSDK.JTransitionValues));
  TRegTypes.RegisterType('PayGoSDK.JInterpolator', TypeInfo(PayGoSDK.JInterpolator));
  TRegTypes.RegisterType('PayGoSDK.JToolbar_LayoutParams', TypeInfo(PayGoSDK.JToolbar_LayoutParams));
  TRegTypes.RegisterType('PayGoSDK.JAplicacaoNaoInstaladaExcecao', TypeInfo(PayGoSDK.JAplicacaoNaoInstaladaExcecao));
  TRegTypes.RegisterType('PayGoSDK.Jinterfaceautomacao_BuildConfig', TypeInfo(PayGoSDK.Jinterfaceautomacao_BuildConfig));
  TRegTypes.RegisterType('PayGoSDK.JCartoes', TypeInfo(PayGoSDK.JCartoes));
  TRegTypes.RegisterType('PayGoSDK.JConfirmacao', TypeInfo(PayGoSDK.JConfirmacao));
  TRegTypes.RegisterType('PayGoSDK.JConfirmacoes', TypeInfo(PayGoSDK.JConfirmacoes));
  TRegTypes.RegisterType('PayGoSDK.JDadosAutomacao', TypeInfo(PayGoSDK.JDadosAutomacao));
  TRegTypes.RegisterType('PayGoSDK.JEntradaTransacao', TypeInfo(PayGoSDK.JEntradaTransacao));
  TRegTypes.RegisterType('PayGoSDK.JFinanciamentos', TypeInfo(PayGoSDK.JFinanciamentos));
  TRegTypes.RegisterType('PayGoSDK.JGlobalDefs', TypeInfo(PayGoSDK.JGlobalDefs));
  TRegTypes.RegisterType('PayGoSDK.JModalidadesPagamento', TypeInfo(PayGoSDK.JModalidadesPagamento));
  TRegTypes.RegisterType('PayGoSDK.JOperacoes', TypeInfo(PayGoSDK.JOperacoes));
  TRegTypes.RegisterType('PayGoSDK.JPersonalizacao', TypeInfo(PayGoSDK.JPersonalizacao));
  TRegTypes.RegisterType('PayGoSDK.JPersonalizacao_1', TypeInfo(PayGoSDK.JPersonalizacao_1));
  TRegTypes.RegisterType('PayGoSDK.JPersonalizacao_Builder', TypeInfo(PayGoSDK.JPersonalizacao_Builder));
  TRegTypes.RegisterType('PayGoSDK.JProvedores', TypeInfo(PayGoSDK.JProvedores));
  TRegTypes.RegisterType('PayGoSDK.JQuedaConexaoTerminalExcecao', TypeInfo(PayGoSDK.JQuedaConexaoTerminalExcecao));
  TRegTypes.RegisterType('PayGoSDK.JSaidaTransacao', TypeInfo(PayGoSDK.JSaidaTransacao));
  TRegTypes.RegisterType('PayGoSDK.JSenderActivity', TypeInfo(PayGoSDK.JSenderActivity));
  TRegTypes.RegisterType('PayGoSDK.JStatusTransacao', TypeInfo(PayGoSDK.JStatusTransacao));
  TRegTypes.RegisterType('PayGoSDK.JTerminal', TypeInfo(PayGoSDK.JTerminal));
  TRegTypes.RegisterType('PayGoSDK.JTerminalDesconectadoExcecao', TypeInfo(PayGoSDK.JTerminalDesconectadoExcecao));
  TRegTypes.RegisterType('PayGoSDK.JTerminalNaoConfiguradoExcecao', TypeInfo(PayGoSDK.JTerminalNaoConfiguradoExcecao));
  TRegTypes.RegisterType('PayGoSDK.JTransacao', TypeInfo(PayGoSDK.JTransacao));
  TRegTypes.RegisterType('PayGoSDK.JTransacaoPendenteDados', TypeInfo(PayGoSDK.JTransacaoPendenteDados));
  TRegTypes.RegisterType('PayGoSDK.JTransacoes', TypeInfo(PayGoSDK.JTransacoes));
  TRegTypes.RegisterType('PayGoSDK.JVersoes', TypeInfo(PayGoSDK.JVersoes));
  TRegTypes.RegisterType('PayGoSDK.JViasImpressao', TypeInfo(PayGoSDK.JViasImpressao));
end;

initialization
  RegisterTypes;
end.

