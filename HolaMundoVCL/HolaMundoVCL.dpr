program HolaMundoVCL;

uses
  Vcl.Forms,
  FPrincipal in 'FPrincipal.pas' {FormPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Hola Mundo VCL';
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
