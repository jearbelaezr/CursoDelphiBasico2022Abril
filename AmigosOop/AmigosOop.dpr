program AmigosOop;

uses
  Vcl.Forms,
  FPrincipal in 'FPrincipal.pas' {FormPrincipal},
  Amigos in 'Amigos.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown:= True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Amigos OOP';
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
