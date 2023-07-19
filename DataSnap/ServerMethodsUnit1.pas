unit ServerMethodsUnit1;
interface
uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, Datasnap.Provider, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, Datasnap.DBClient, Data.FMTBcd,
  Data.SqlExpr, Midas;
type
  TServerMethods1 = class(TDSServerModule)
    DSconnection: TFDConnection;
    DSPVentas: TDataSetProvider;
    Rventas: TFDQuery;
    RcifraVentas: TFDQuery;
    DSPCifraVent: TDataSetProvider;
    RIngresos: TFDQuery;
    FVentasIMP: TFDQuery;
    FArticulos: TFDQuery;
    DSPIngresos: TDataSetProvider;
    DSPVentasIMP: TDataSetProvider;
    DSPArticulo: TDataSetProvider;
    Fdesembolsos: TFDQuery;
    FCantidad: TFDQuery;
    DSPdesembolso: TDataSetProvider;
    DSPcantidad: TDataSetProvider;
    Fdeparta: TFDQuery;
    Fproductos: TFDQuery;
    DSPdeparta: TDataSetProvider;
    DSPproducto: TDataSetProvider;
    Finfocliente: TFDQuery;
    Fcuentas: TFDQuery;
    FfactAbiertas: TFDQuery;
    DSPinfocliente: TDataSetProvider;
    DSPcuentas: TDataSetProvider;
    DSPfactabiertas: TDataSetProvider;
    FDetalleDes: TFDQuery;
    DSPdetalleDes: TDataSetProvider;
    FLocalidad: TFDQuery;
    DSLocalidad: TDataSetProvider;
    Fcomprobantes: TFDQuery;
    FcompDefecto: TFDQuery;
    DSPComprobantes: TDataSetProvider;
    DSPcompDefecto: TDataSetProvider;
    Finventario_ins: TFDQuery;
    DSinventario_ins: TDataSetProvider;
    FUsuarios: TFDQuery;
    FDepartamento: TFDQuery;
    FExistencia: TFDQuery;
    DSusuarios: TDataSetProvider;
    DSdepartamento: TDataSetProvider;
    DSexistencia: TDataSetProvider;
    Fesperasfact: TFDQuery;
    Feliminadas: TFDQuery;
    FDetalleFactEsp: TFDQuery;
    DSesperaFact: TDataSetProvider;
    DSeliminada: TDataSetProvider;
    DSdetalleFactEsp: TDataSetProvider;
    FfacturaTipo: TFDQuery;
    DSfacturaTipo: TDataSetProvider;
    DSmesas: TDataSetProvider;
    FMesas: TFDQuery;
    FEjecutor: TFDQuery;
    DSPejecutor: TDataSetProvider;
    Fpreguntas: TFDQuery;
    DSPpreguntas: TDataSetProvider;
    Frespuestas: TFDQuery;
    DSPrespuestas: TDataSetProvider;
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    procedure ProcN1 (Sender : Tobject);
  end;
implementation
{$R *.dfm}
uses System.StrUtils;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;
function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;
procedure TServerMethods1.ProcN1(Sender : Tobject);
 begin
 end;
end.
