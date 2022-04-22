unit FDataModuleAmigos;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Data.DBXInterBase, Data.SqlExpr;

type
  TDataModuleAmigos = class(TDataModule)
    SQLConnection1: TSQLConnection;
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

end.
