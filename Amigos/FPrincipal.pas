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
    LabelIdentificador: TLabel;
    DBEditIdentificador: TDBEdit;
    LabelNombre: TLabel;
    DBEditNombre: TDBEdit;
    LabelAlias: TLabel;
    DBEditAlias: TDBEdit;
    LabelTelefono: TLabel;
    DBEditTelefono: TDBEdit;
    DBNavigator: TDBNavigator;
    FileOpenDialog: TFileOpenDialog;
    FileSaveDialog: TFileSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure FDMemTableAmigosAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    FNombreArchivo: string;
    function GetNombreArchivo: string;
    procedure SetNombreArchivo(const Value: string); // Campo - Field
  public
    { Public declarations }
    property NombreArchivo: string read GetNombreArchivo write SetNombreArchivo;
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
  if NombreArchivo = '' then
  begin
    if FileSaveDialog.Execute then
    begin
      NombreArchivo := FileSaveDialog.FileName;
    end;
  end;
  if NombreArchivo <> '' then
  begin
    FDMemTableAmigos.SaveToFile(NombreArchivo, TipoArchivo);
  end;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  PageControl.ActivePage := TabSheetResumen;
  FileOpenDialog.DefaultFolder := GetCurrentDir;
  FileOpenDialog.FileName := '';
  if FileOpenDialog.Execute and FileExists(FileOpenDialog.FileName) then
  begin
    FDMemTableAmigos.LoadFromFile(FileOpenDialog.FileName, TipoArchivo);
  end
  else
  begin
    FDMemTableAmigos.CreateDataSet;
  end;
  NombreArchivo := FileOpenDialog.FileName;
end;

function TFormPrincipal.GetNombreArchivo: string;
begin
  Result := FNombreArchivo;
end;

procedure TFormPrincipal.SetNombreArchivo(const Value: string);
begin
  FNombreArchivo := Value;
  Caption := ExtractFileName(FNombreArchivo) + ' - Lista de Amigos';
end;

end.
