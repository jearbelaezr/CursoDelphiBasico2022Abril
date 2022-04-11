program Amigos;

uses
  Vcl.Forms,
  FPrincipal in 'FPrincipal.pas' {FormPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Lista de Amigos';
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
