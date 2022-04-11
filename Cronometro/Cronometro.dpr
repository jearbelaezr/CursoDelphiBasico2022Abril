program Cronometro;

uses
  Vcl.Forms,
  FPrincipal in 'FPrincipal.pas' {FormPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Cronómetro';
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
