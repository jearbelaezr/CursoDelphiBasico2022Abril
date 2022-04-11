program HolaMundoFMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  FPrincipal in 'FPrincipal.pas' {FormPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.Title:= 'Hola Mundo FMX';
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
