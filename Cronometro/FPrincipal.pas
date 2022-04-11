unit FPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls;

type
  TEstadoCronometro = (Detenido, Iniciado, Pausado);

  TFormPrincipal = class(TForm)
    LabelCronometro: TLabel;
    PanelBotones: TPanel;
    TimerCronometro: TTimer;
    LabelIniciar: TLabel;
    LabelPausar: TLabel;
    LabelDetener: TLabel;
    LabelReiniciar: TLabel;
    procedure TimerCronometroTimer(Sender: TObject);
    procedure LabelIniciarClick(Sender: TObject);
    procedure LabelPausarClick(Sender: TObject);
    procedure LabelDetenerClick(Sender: TObject);
    procedure LabelReiniciarClick(Sender: TObject);
  private
    { Private declarations }
    HoraInicial: TDateTime;
    TiempoAcumulado: TDateTime;
    procedure NuevoEstado(Estado: TEstadoCronometro);
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

procedure TFormPrincipal.LabelPausarClick(Sender: TObject);
begin
  TimerCronometro.Enabled := False;
  TiempoAcumulado := TiempoAcumulado + Now - HoraInicial;
  NuevoEstado(TEstadoCronometro.Pausado);
end;

procedure TFormPrincipal.LabelReiniciarClick(Sender: TObject);
begin
  LabelDetenerClick(nil);
  LabelIniciarClick(nil);
end;

procedure TFormPrincipal.NuevoEstado(Estado: TEstadoCronometro);
begin
  LabelIniciar.Enabled:= Estado <> TEstadoCronometro.Iniciado;
  LabelPausar.Enabled:= Estado = TEstadoCronometro.Iniciado;
  LabelDetener.Enabled:= Estado <> TEstadoCronometro.Detenido;
  LabelReiniciar.Enabled:= Estado <> TEstadoCronometro.Detenido;
end;

procedure TFormPrincipal.LabelDetenerClick(Sender: TObject);
begin
  TimerCronometro.Enabled := False;
  LabelCronometro.Caption := FormatDateTime('hh:nn:ss.zzz', 0);
  TiempoAcumulado:= 0;
  NuevoEstado(TEstadoCronometro.Detenido);
end;

procedure TFormPrincipal.LabelIniciarClick(Sender: TObject);
begin
  HoraInicial := Now;
  TimerCronometro.Enabled := True;
  NuevoEstado(TEstadoCronometro.Iniciado);
end;

procedure TFormPrincipal.TimerCronometroTimer(Sender: TObject);
var
  Lapso: TDateTime;
begin
  Lapso := Now - HoraInicial + TiempoAcumulado;
  LabelCronometro.Caption := FormatDateTime('hh:nn:ss.zzz', Lapso);
end;

end.
