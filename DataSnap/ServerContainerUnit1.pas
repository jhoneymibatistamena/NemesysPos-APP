unit ServerContainerUnit1;
interface
uses System.SysUtils, System.Classes,
    Vcl.SvcMgr,
  Datasnap.DSTCPServerTransport,
    Datasnap.DSHTTPCommon, Datasnap.DSHTTP,
  Datasnap.DSServer, Datasnap.DSCommonServer,
  Datasnap.DSClientMetadata, Datasnap.DSHTTPServiceProxyDispatcher,
  Datasnap.DSProxyJavaAndroid, Datasnap.DSProxyJavaBlackBerry,
  Datasnap.DSProxyObjectiveCiOS, Datasnap.DSProxyCsharpSilverlight,
  Datasnap.DSProxyFreePascal_iOS,
  IPPeerServer, IPPeerAPI, Datasnap.DSAuth, DbxSocketChannelNative,
  DbxCompressionFilter, Datasnap.DSProxyJavaScript, Datasnap.DSMetadata,
  Datasnap.DSServerMetadata, System.Win.Registry, midas;
type
  TNemeSysDataSnap = class(TService)
    DSServer1: TDSServer;
    DSTCPServerTransport1: TDSTCPServerTransport;
    DSAuthenticationManager1: TDSAuthenticationManager;
    DSHTTPServiceProxyDispatcher1: TDSHTTPServiceProxyDispatcher;
    DSServerClass1: TDSServerClass;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSAuthenticationManager1UserAuthorize(Sender: TObject;
      EventObject: TDSAuthorizeEventObject; var valid: Boolean);
    procedure DSCertFiles1GetPEMFileSBPasskey(ASender: TObject;
      APasskey: TStringBuilder);
    procedure DSAuthenticationManager1UserAuthenticate(Sender: TObject;
      const Protocol, Context, User, Password: string; var valid: Boolean;
      UserRoles: TStrings);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure DataModuleCreate(Sender: TObject);
    procedure ServiceAfterInstall(Sender: TService);
  private
    { Private declarations }
  protected
    function DoStop: Boolean; override;
    function DoPause: Boolean; override;
    function DoContinue: Boolean; override;
    procedure DoInterrogate; override;
  public
    function GetServiceController: TServiceController; override;
  end;
var
  NemeSysDataSnap: TNemeSysDataSnap;
implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}
uses
  Winapi.Windows,
  ServerMethodsUnit1;
procedure TNemeSysDataSnap.DataModuleCreate(Sender: TObject);
begin
  //write the JavaScript proxy on startup
  //DSProxyGenerator1.Write;
end;
procedure TNemeSysDataSnap.DSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethodsUnit1.TServerMethods1;
end;
procedure TNemeSysDataSnap.DSAuthenticationManager1UserAuthenticate(
  Sender: TObject; const Protocol, Context, User, Password: string;
  var valid: Boolean; UserRoles: TStrings);
begin
  { TODO : Validate the client user and password.
    If role-based authorization is needed, add role names to the UserRoles parameter  }
  valid := (user = 'Jamen')and(password = 'Soporte20');
end;
procedure TNemeSysDataSnap.DSAuthenticationManager1UserAuthorize(
  Sender: TObject; EventObject: TDSAuthorizeEventObject;
  var valid: Boolean);
begin
  { TODO : Authorize a user to execute a method.
    Use values from EventObject such as UserName, UserRoles, AuthorizedRoles and DeniedRoles.
    Use DSAuthenticationManager1.Roles to define Authorized and Denied roles
    for particular server methods. }
  valid := True;
end;
procedure TNemeSysDataSnap.DSCertFiles1GetPEMFileSBPasskey(ASender: TObject; APasskey: TStringBuilder);
begin
  if APasskey <> nil then
  	APasskey.Append('');
end;
procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  NemeSysDataSnap.Controller(CtrlCode);
end;
function TNemeSysDataSnap.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;
function TNemeSysDataSnap.DoContinue: Boolean;
begin
  Result := inherited;
  DSServer1.Start;
end;
procedure TNemeSysDataSnap.DoInterrogate;
begin
  inherited;
end;
function TNemeSysDataSnap.DoPause: Boolean;
begin
  DSServer1.Stop;
  Result := inherited;
end;
function TNemeSysDataSnap.DoStop: Boolean;
begin
  DSServer1.Stop;
  Result := inherited;
end;
procedure TNemeSysDataSnap.ServiceAfterInstall(Sender: TService);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create(KEY_READ or KEY_WRITE);

  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\SYSTEM\CurrentControlSet\Services\' + Name, false) then
    begin
      Reg.WriteString('Description', 'Servidor de datos de la APP NemeSysPOS');
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TNemeSysDataSnap.ServiceStart(Sender: TService; var Started: Boolean);
begin
  DSServer1.Start;
end;

end.
