program AmigosDB;

uses
  Vcl.Forms,
  FPrincipal in 'FPrincipal.pas' {FormAmigos},
  FDataModuleAmigos in 'FDataModuleAmigos.pas' {DataModuleAmigos: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormAmigos, FormAmigos);
  Application.CreateForm(TDataModuleAmigos, DataModuleAmigos);
  Application.Run;
end.
