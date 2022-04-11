object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Cron'#243'metro'
  ClientHeight = 392
  ClientWidth = 804
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object LabelCronometro: TLabel
    Left = 0
    Top = 0
    Width = 804
    Height = 295
    Align = alClient
    Alignment = taCenter
    Caption = '00:00:00.000'
    Color = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -128
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
    ExplicitWidth = 705
    ExplicitHeight = 170
  end
  object PanelBotones: TPanel
    Left = 0
    Top = 295
    Width = 804
    Height = 97
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 432
    ExplicitWidth = 505
    object LabelIniciar: TLabel
      Left = 48
      Top = -3
      Width = 49
      Height = 92
      Caption = '>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -69
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = LabelIniciarClick
    end
    object LabelPausar: TLabel
      Left = 152
      Top = 16
      Width = 28
      Height = 65
      Caption = 'll'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -48
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = LabelPausarClick
    end
    object LabelDetener: TLabel
      Left = 264
      Top = 16
      Width = 31
      Height = 65
      Caption = 'X'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -48
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = LabelDetenerClick
    end
    object LabelReiniciar: TLabel
      Left = 368
      Top = -3
      Width = 49
      Height = 92
      Caption = '<'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -69
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = LabelReiniciarClick
    end
  end
  object TimerCronometro: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerCronometroTimer
    Left = 704
    Top = 320
  end
end
