unit FDataModuleAmigos;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Data.DBXInterBase, Data.SqlExpr, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDataModuleAmigos = class(TDataModule)
    SQLConnection: TSQLConnection;
    FDConnection: TFDConnection;
    FDTableaAmigo: TFDTable;
    FDTableaAmigoID: TIntegerField;
    FDTableaAmigoNOMBRE: TStringField;
    FDTableaAmigoALIAS: TStringField;
    FDTableaAmigoTELEFONO: TStringField;
    FDQueryContar: TFDQuery;
    FDQueryContarCANTIDAD: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleAmigos: TDataModuleAmigos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModuleAmigos.DataModuleCreate(Sender: TObject);
begin
  FDConnection.Open;
  FDTableaAmigo.Open;
end;

end.
