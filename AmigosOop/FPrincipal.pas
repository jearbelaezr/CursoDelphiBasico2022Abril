unit FPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.ToolWin,
  Vcl.ComCtrls, Vcl.StdCtrls, System.Actions, Vcl.ActnList, System.ImageList,
  Vcl.ImgList,
  Amigos;

type
  TEstadoAmigos = (Edicion, Guardado);

  TFormPrincipal = class(TForm)
    PageControl: TPageControl;
    TabSheetResumen: TTabSheet;
    TabSheetDetalles: TTabSheet;
    ToolBar: TToolBar;
    LabelIdentificador: TLabel;
    EditIdentificador: TEdit;
    LabelNombre: TLabel;
    EditNombre: TEdit;
    LabelAlias: TLabel;
    EditAlias: TEdit;
    LabelTelefono: TLabel;
    EditTelefono: TEdit;
    ImageList: TImageList;
    ToolButtonPrimero: TToolButton;
    ToolButtonAnterior: TToolButton;
    ToolButtonSiguiente: TToolButton;
    ToolButtonUltimo: TToolButton;
    ToolButtonAgregar: TToolButton;
    ToolButtonEliminar: TToolButton;
    ToolButtonEditar: TToolButton;
    ToolButtonGuardar: TToolButton;
    ToolButtonCancelar: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ToolButtonAgregarClick(Sender: TObject);
    procedure ToolButtonCancelarClick(Sender: TObject);
    procedure ToolButtonGuardarClick(Sender: TObject);
    procedure ToolButtonPrimeroClick(Sender: TObject);
    procedure ToolButtonAnteriorClick(Sender: TObject);
    procedure ToolButtonSiguienteClick(Sender: TObject);
    procedure ToolButtonUltimoClick(Sender: TObject);
    procedure ToolButtonEliminarClick(Sender: TObject);
    procedure ToolButtonEditarClick(Sender: TObject);
  private
    { Private declarations }
    FListaAmigos: TListaAmigos;
    FIndiceAmigo: Integer;
    FEstado: TEstadoAmigos;
    procedure SetEstado(const Value: TEstadoAmigos);
    procedure SetIndiceAmigo(const Value: Integer);
    property Estado: TEstadoAmigos read FEstado write SetEstado;
    property IndiceAmigo: Integer read FIndiceAmigo write SetIndiceAmigo;
    procedure LimpiarCampos;
    procedure Refrescar;
    procedure Persistir;
    procedure Cargar;
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

const
  NombreArchivo = 'Amigos.txt';

{$R *.dfm}

procedure TFormPrincipal.Cargar;
var
  F: TextFile;
  Id: Integer;
  Nombre, Alias, Telefono: string;
  Amigo: TAmigo;
begin
  if FileExists(NombreArchivo) then
  begin
    AssignFile(F, NombreArchivo);
    Reset(F);
    try
      while not Eof(F) do
      begin
        Readln(F, Id);
        Readln(F, Nombre);
        Readln(F, Alias);
        Readln(F, Telefono);
        Amigo:= TAmigo.Create;
        Amigo.Id:= Id;
        Amigo.Nombre:= Nombre;
        Amigo.Alias:= Alias;
        Amigo.Telefono:= Telefono;
        FListaAmigos.Add(Amigo);
      end;
    finally
      CloseFile(F);
    end;
  end;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  FListaAmigos := TListaAmigos.Create;
  Cargar;
  IndiceAmigo := FListaAmigos.Count - 1;
  Estado := TEstadoAmigos.Guardado;
end;

procedure TFormPrincipal.FormDestroy(Sender: TObject);
begin
  FListaAmigos.Free;
end;

procedure TFormPrincipal.LimpiarCampos;
begin
  EditIdentificador.Clear;
  EditNombre.Clear;
  EditAlias.Clear;
  EditTelefono.Clear;
end;

procedure TFormPrincipal.Persistir;
var
  F: TextFile;
begin
  AssignFile(F, NombreArchivo);
  Rewrite(F);
  try
    for var Amigo: TAmigo in FListaAmigos do
    begin
      Writeln(F, Amigo.Id);
      Writeln(F, Amigo.Nombre);
      Writeln(F, Amigo.Alias);
      Writeln(F, Amigo.Telefono);
    end;
  finally
    CloseFile(F);
  end;
end;

procedure TFormPrincipal.Refrescar;
begin
  ToolButtonPrimero.Enabled := (FEstado = TEstadoAmigos.Guardado) and
    (IndiceAmigo <> -1) and (IndiceAmigo <> 0);
  ToolButtonAnterior.Enabled := (FEstado = TEstadoAmigos.Guardado) and
    (IndiceAmigo <> -1) and (IndiceAmigo <> 0);
  ToolButtonSiguiente.Enabled := (FEstado = TEstadoAmigos.Guardado) and
    (IndiceAmigo <> -1) and (IndiceAmigo <> FListaAmigos.Count - 1);
  ToolButtonUltimo.Enabled := (FEstado = TEstadoAmigos.Guardado) and
    (IndiceAmigo <> -1) and (IndiceAmigo <> FListaAmigos.Count - 1);
  ToolButtonAgregar.Enabled := FEstado = TEstadoAmigos.Guardado;
  ToolButtonEliminar.Enabled := (FEstado = TEstadoAmigos.Guardado) and
    (IndiceAmigo <> -1);
  ToolButtonEditar.Enabled := (FEstado = TEstadoAmigos.Guardado) and
    (IndiceAmigo <> -1);
  ToolButtonGuardar.Enabled := FEstado = TEstadoAmigos.Edicion;
  ToolButtonCancelar.Enabled := FEstado = TEstadoAmigos.Edicion;
  EditIdentificador.ReadOnly := FEstado = TEstadoAmigos.Guardado;
  EditNombre.ReadOnly := FEstado = TEstadoAmigos.Guardado;
  EditAlias.ReadOnly := FEstado = TEstadoAmigos.Guardado;
  EditTelefono.ReadOnly := FEstado = TEstadoAmigos.Guardado;
  case FEstado of
    TEstadoAmigos.Guardado:
      begin
        EditIdentificador.Color := clInactiveCaption;
        EditNombre.Color := clInactiveCaption;
        EditAlias.Color := clInactiveCaption;
        EditTelefono.Color := clInactiveCaption;
      end;
    TEstadoAmigos.Edicion:
      begin
        EditIdentificador.Color := clWindow;
        EditNombre.Color := clWindow;
        EditAlias.Color := clWindow;
        EditTelefono.Color := clWindow;
      end;
  end;
  if FIndiceAmigo <> -1 then
  begin
    EditIdentificador.Text := IntToStr(FListaAmigos[FIndiceAmigo].Id);
    EditNombre.Text := FListaAmigos[FIndiceAmigo].Nombre;
    EditAlias.Text := FListaAmigos[FIndiceAmigo].Alias;
    EditTelefono.Text := FListaAmigos[FIndiceAmigo].Telefono;
  end
  else
  begin
    LimpiarCampos;
  end;
end;

procedure TFormPrincipal.SetEstado(const Value: TEstadoAmigos);
begin
  if FEstado <> Value then
  begin
    FEstado := Value;
    Refrescar;
  end;
end;

procedure TFormPrincipal.SetIndiceAmigo(const Value: Integer);
begin
  if FIndiceAmigo <> Value then
  begin
    FIndiceAmigo := Value;
    Refrescar;
  end;
end;

procedure TFormPrincipal.ToolButtonAgregarClick(Sender: TObject);
begin
  IndiceAmigo := -1;
  Estado := TEstadoAmigos.Edicion;
end;

procedure TFormPrincipal.ToolButtonAnteriorClick(Sender: TObject);
begin
  if IndiceAmigo > 0 then
  begin
    IndiceAmigo := IndiceAmigo - 1;
  end;
end;

procedure TFormPrincipal.ToolButtonCancelarClick(Sender: TObject);
begin
  if IndiceAmigo = -1 then
  begin
    IndiceAmigo := FListaAmigos.Count - 1;
  end;
  Estado := TEstadoAmigos.Guardado;
end;

procedure TFormPrincipal.ToolButtonEditarClick(Sender: TObject);
begin
  Estado := TEstadoAmigos.Edicion;
end;

procedure TFormPrincipal.ToolButtonEliminarClick(Sender: TObject);
var
  AmigoABorrar: TAmigo;
begin
  AmigoABorrar := FListaAmigos[IndiceAmigo];
  FListaAmigos.Remove(AmigoABorrar);
  if IndiceAmigo > FListaAmigos.Count - 1 then
  begin
    IndiceAmigo := FListaAmigos.Count - 1;
  end;
  Refrescar;
  Persistir;
end;

procedure TFormPrincipal.ToolButtonGuardarClick(Sender: TObject);
var
  Amigo: TAmigo;
begin
  if EditIdentificador.Text = '' then
  begin
    raise Exception.Create('Debe ingresar un identificador');
  end;
  if EditNombre.Text = '' then
  begin
    raise Exception.Create('Debe ingresar un nombre');
  end;
  if IndiceAmigo = -1 then
  begin
    Amigo := TAmigo.Create;
    FListaAmigos.Add(Amigo);
  end
  else
  begin
    Amigo := FListaAmigos[IndiceAmigo];
  end;
  Amigo.Id := StrToInt(EditIdentificador.Text);
  Amigo.Nombre := EditNombre.Text;
  Amigo.Alias := EditAlias.Text;
  Amigo.Telefono := EditTelefono.Text;
  if IndiceAmigo = -1 then
  begin
    IndiceAmigo := FListaAmigos.Count - 1;
  end;
  Estado := TEstadoAmigos.Guardado;
  Persistir;
end;

procedure TFormPrincipal.ToolButtonPrimeroClick(Sender: TObject);
begin
  IndiceAmigo := 0;
end;

procedure TFormPrincipal.ToolButtonSiguienteClick(Sender: TObject);
begin
  if IndiceAmigo < FListaAmigos.Count - 1 then
  begin
    IndiceAmigo := IndiceAmigo + 1;
  end;
end;

procedure TFormPrincipal.ToolButtonUltimoClick(Sender: TObject);
begin
  IndiceAmigo := FListaAmigos.Count - 1;
end;

end.
