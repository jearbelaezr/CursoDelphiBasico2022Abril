unit FPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask;

type
  TFormAmigos = class(TForm)
    DataSourceAmigo: TDataSource;
    ToolBar: TToolBar;
    PageControl: TPageControl;
    TabSheetResumen: TTabSheet;
    TabSheetDetalles: TTabSheet;
    DBGridAmigos: TDBGrid;
    DBNavigator: TDBNavigator;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    StatusBar: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DataSourceAmigoDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    procedure DespleagarContadores;
  public
    { Public declarations }
  end;

var
  FormAmigos: TFormAmigos;

implementation

{$R *.dfm}

uses
  FDataModuleAmigos;

procedure TFormAmigos.DataSourceAmigoDataChange(Sender: TObject; Field: TField);
begin
  DespleagarContadores;
end;

procedure TFormAmigos.DespleagarContadores;
begin
  if DataModuleAmigos <> nil then
  begin
    DataModuleAmigos.FDQueryContar.Open;
    try
      StatusBar.SimpleText := Format('Tengo %d amigos',
        [DataModuleAmigos.FDQueryContarCANTIDAD.AsInteger]);
    finally
      DataModuleAmigos.FDQueryContar.Close;
    end;
  end;
end;

procedure TFormAmigos.FormCreate(Sender: TObject);
begin
  DataModuleAmigos := TDataModuleAmigos.Create(Self);
  DespleagarContadores;
end;

procedure TFormAmigos.FormDestroy(Sender: TObject);
begin
  DataModuleAmigos.Free;
end;

end.
