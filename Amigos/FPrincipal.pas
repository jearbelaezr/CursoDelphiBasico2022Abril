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
    FDMemTableAmigosId: TFDAutoIncField;
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
    LabelFiltro: TLabel;
    EditFiltro: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FDMemTableAmigosAfterPost(DataSet: TDataSet);
    procedure FDMemTableAmigosBeforePost(DataSet: TDataSet);
    procedure DBGridMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure EditFiltroChange(Sender: TObject);
  private
    { Private declarations }
    FNombreArchivo: string;
    function GetNombreArchivo: string;
    procedure SetNombreArchivo(const Value: string); // Campo - Field
    procedure ValidarRequeridos(Tabla: TDataSet);
  public
    { Public declarations }
    property NombreArchivo: string read GetNombreArchivo write SetNombreArchivo;
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

const
  TipoArchivo = TFDStorageFormat.sfJSON;

procedure TFormPrincipal.DBGridMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  GridCoord: TGridCoord;
begin
  GridCoord := DBGrid.MouseCoord(X, Y);
  if GridCoord.Y = 0 then // Verificar clic en la fila de títulos.
  begin
    if GridCoord.X > 0 then
    begin
      FDMemTableAmigos.IndexFieldNames := DBGrid.Columns[GridCoord.X - 1]
        .Field.FieldName;
      for var I := 0 to DBGrid.Columns.Count - 1 do
      begin
        DBGrid.Columns[I].Title.Font.Style := DBGrid.Columns[I].Title.Font.Style
          - [fsBold];
      end;
      DBGrid.Columns[GridCoord.X - 1].Title.Font.Style :=
        DBGrid.Columns[GridCoord.X - 1].Title.Font.Style + [fsBold];
    end;
  end;
end;

procedure TFormPrincipal.EditFiltroChange(Sender: TObject);
var
  TextoBuscado: string;
begin
  TextoBuscado := ' like ' + QuotedStr('%' + EditFiltro.Text + '%');
  FDMemTableAmigos.Filter := '(Nombre  ' + TextoBuscado + ') or (Alias ' +
    TextoBuscado + ')';
  FDMemTableAmigos.Filtered := True;
end;

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

procedure TFormPrincipal.FDMemTableAmigosBeforePost(DataSet: TDataSet);
begin
  ValidarRequeridos(FDMemTableAmigos);
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  FDMemTableAmigosId.AutoIncrementSeed:= 1;
  FDMemTableAmigosId.AutoIncrementStep:= 1;
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

procedure TFormPrincipal.ValidarRequeridos(Tabla: TDataSet);
begin
  for var Field in Tabla.Fields do
  begin
    if Field.Required and Field.IsNull then
    begin
      raise Exception.Create('El campo ' + Field.DisplayLabel +
        ' es oolgatorio');
    end;
  end;
end;

end.
