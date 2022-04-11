object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Hola Mundo'
  ClientHeight = 161
  ClientWidth = 500
  Color = clBtnFace
  Constraints.MinHeight = 150
  Constraints.MinWidth = 200
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  DesignSize = (
    500
    161)
  TextHeight = 15
  object LabelNombre: TLabel
    Left = 16
    Top = 16
    Width = 44
    Height = 15
    Caption = 'Nombre'
  end
  object EditNombre: TEdit
    Left = 16
    Top = 37
    Width = 467
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    ExplicitWidth = 155
  end
  object ButtonSaludar: TButton
    Left = 408
    Top = 66
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Saludar'
    TabOrder = 1
    OnClick = ButtonSaludarClick
    ExplicitLeft = 96
  end
end
