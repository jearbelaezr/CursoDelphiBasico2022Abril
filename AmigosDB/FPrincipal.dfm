object FormAmigos: TFormAmigos
  Left = 0
  Top = 0
  Caption = 'Amigos DB'
  ClientHeight = 299
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 549
    Height = 29
    Caption = 'ToolBar'
    TabOrder = 0
    ExplicitLeft = 256
    ExplicitTop = 32
    ExplicitWidth = 150
    object DBNavigator: TDBNavigator
      Left = 0
      Top = 0
      Width = 240
      Height = 22
      DataSource = DataSourceAmigo
      Hints.Strings = (
        'Primero'
        'Anterior'
        'Siguiente'
        #218'ltimo'
        'Insertar'
        'Borrar'
        'Editar'
        'Guardar'
        'Cancelar'
        'Refrescar'
        'Aplicar cambios'
        'Cancelar cambios')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 29
    Width = 549
    Height = 251
    ActivePage = TabSheetDetalles
    Align = alClient
    TabOrder = 1
    ExplicitTop = 28
    ExplicitHeight = 412
    object TabSheetResumen: TTabSheet
      Caption = 'Resumen'
      object DBGridAmigos: TDBGrid
        Left = 0
        Top = 0
        Width = 541
        Height = 221
        Align = alClient
        DataSource = DataSourceAmigo
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Color = clActiveCaption
            Expanded = False
            FieldName = 'ID'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIAS'
            Visible = True
          end
          item
            Color = clAqua
            Expanded = False
            FieldName = 'TELEFONO'
            Visible = True
          end>
      end
    end
    object TabSheetDetalles: TTabSheet
      Caption = 'Detalles'
      ImageIndex = 1
      DesignSize = (
        541
        221)
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 67
        Height = 15
        Caption = 'Identificador'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 16
        Top = 64
        Width = 44
        Height = 15
        Caption = 'Nombre'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 16
        Top = 112
        Width = 25
        Height = 15
        Caption = 'Alias'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 16
        Top = 160
        Width = 45
        Height = 15
        Caption = 'Tel'#233'fono'
        FocusControl = DBEdit4
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 32
        Width = 154
        Height = 23
        Color = clInactiveCaption
        DataField = 'ID'
        DataSource = DataSourceAmigo
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 16
        Top = 80
        Width = 503
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        DataField = 'NOMBRE'
        DataSource = DataSourceAmigo
        TabOrder = 1
        ExplicitWidth = 304
      end
      object DBEdit3: TDBEdit
        Left = 16
        Top = 128
        Width = 503
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        DataField = 'ALIAS'
        DataSource = DataSourceAmigo
        TabOrder = 2
        ExplicitWidth = 304
      end
      object DBEdit4: TDBEdit
        Left = 16
        Top = 176
        Width = 503
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        DataField = 'TELEFONO'
        DataSource = DataSourceAmigo
        TabOrder = 3
        ExplicitWidth = 304
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 280
    Width = 549
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'Tengo %d amigo'
    ExplicitLeft = 280
    ExplicitTop = 160
    ExplicitWidth = 0
  end
  object DataSourceAmigo: TDataSource
    DataSet = DataModuleAmigos.FDTableaAmigo
    OnDataChange = DataSourceAmigoDataChange
    Left = 320
    Top = 72
  end
end
