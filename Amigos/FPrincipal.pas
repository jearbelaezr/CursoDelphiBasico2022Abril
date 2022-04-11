unit FPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.ToolWin, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageJSON, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask;

type
  TFormPrincipal = class(TForm)
    FDMemTableAmigos: TFDMemTable;
    FDMemTableAmigosNombre: TStringField;
    FDMemTableAmigosTelefono: TStringField;
    ToolBar: TToolBar;
    PanelPrincipal: TPanel;
    PageControl: TPageControl;
    TabSheetResumen: TTabSheet;
    TabSheetDetalles: TTabSheet;
    DBGrid: TDBGrid;
    DataSourceAmigos: TDataSource;
    FDMemTableAmigosId: TIntegerField;
    FDStanStorageJSONLink: TFDStanStorageJSONLink;
    FDMemTableAmigosAlias: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBNavigator1: TDBNavigator;
    FileOpenDialog: TFileOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure FDMemTableAmigosAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

const
  // NombreArchivo = 'SuperAmigos.ami';
  TipoArchivo = TFDStorageFormat.sfJSON;

procedure TFormPrincipal.FDMemTableAmigosAfterPost(DataSet: TDataSet);
begin
  FDMemTableAmigos.SaveToFile(FileOpenDialog.FileName, TipoArchivo);
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  FileOpenDialog.DefaultFolder := GetCurrentDir;
  if FileOpenDialog.Execute and FileExists(FileOpenDialog.FileName) then
  begin
    FDMemTableAmigos.LoadFromFile(FileOpenDialog.FileName, TipoArchivo);
  end
  else
  begin
    FDMemTableAmigos.CreateDataSet;
  end;
end;

end.
