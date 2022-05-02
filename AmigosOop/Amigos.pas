unit Amigos;

interface

uses
  System.Generics.Collections;

type
  TAmigo = class
  strict private
    FId: Integer;
    FNombre: string;
    FAlias: string;
    FTelefono: string;
  private
    function GetId: Integer;
    procedure SetId(const Value: Integer);
  public
    property Id: Integer read GetId write SetId;
    property Nombre: string read FNombre write FNombre;
    property Alias: string read FAlias write FAlias;
    property Telefono: string read FTelefono write FTelefono;
  end;

  TListaAmigos = TObjectList<TAmigo>;

implementation

{ TAmigo }

function TAmigo.GetId: Integer;
begin
  Result := FId;
end;

procedure TAmigo.SetId(const Value: Integer);
begin
  if Value > 0 then
  begin
    FId := Value;
  end;
end;

end.
