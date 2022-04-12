object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Lista de Amigos'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 624
    Height = 29
    Caption = 'ToolBar'
    TabOrder = 0
    object DBNavigator: TDBNavigator
      Left = 0
      Top = 0
      Width = 240
      Height = 22
      DataSource = DataSourceAmigos
      TabOrder = 0
    end
  end
  object PanelPrincipal: TPanel
    Left = 0
    Top = 29
    Width = 624
    Height = 412
    Align = alClient
    TabOrder = 1
    object PageControl: TPageControl
      Left = 1
      Top = 1
      Width = 622
      Height = 410
      ActivePage = TabSheetDetalles
      Align = alClient
      TabOrder = 0
      object TabSheetResumen: TTabSheet
        Caption = 'Resumen'
        object DBGrid: TDBGrid
          Left = 0
          Top = 0
          Width = 614
          Height = 380
          Align = alClient
          Color = clWhite
          DataSource = DataSourceAmigos
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Columns = <
            item
              Color = clAqua
              Expanded = False
              FieldName = 'Id'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Nombre'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Alias'
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'Telefono'
              Visible = True
            end>
        end
      end
      object TabSheetDetalles: TTabSheet
        Caption = 'Detalles'
        ImageIndex = 1
        object LabelIdentificador: TLabel
          Left = 8
          Top = 16
          Width = 67
          Height = 15
          Caption = 'Identificador'
          FocusControl = DBEditIdentificador
        end
        object LabelNombre: TLabel
          Left = 8
          Top = 64
          Width = 44
          Height = 15
          Caption = 'Nombre'
          FocusControl = DBEditNombre
        end
        object LabelAlias: TLabel
          Left = 8
          Top = 112
          Width = 25
          Height = 15
          Caption = 'Alias'
          FocusControl = DBEditAlias
        end
        object LabelTelefono: TLabel
          Left = 8
          Top = 160
          Width = 45
          Height = 15
          Caption = 'Tel'#233'fono'
          FocusControl = DBEditTelefono
        end
        object DBEditIdentificador: TDBEdit
          Left = 8
          Top = 32
          Width = 154
          Height = 23
          DataField = 'Id'
          DataSource = DataSourceAmigos
          TabOrder = 0
        end
        object DBEditNombre: TDBEdit
          Left = 8
          Top = 80
          Width = 454
          Height = 23
          DataField = 'Nombre'
          DataSource = DataSourceAmigos
          TabOrder = 1
        end
        object DBEditAlias: TDBEdit
          Left = 8
          Top = 128
          Width = 304
          Height = 23
          DataField = 'Alias'
          DataSource = DataSourceAmigos
          TabOrder = 2
        end
        object DBEditTelefono: TDBEdit
          Left = 8
          Top = 176
          Width = 229
          Height = 23
          DataField = 'Telefono'
          DataSource = DataSourceAmigos
          TabOrder = 3
        end
      end
    end
  end
  object FDMemTableAmigos: TFDMemTable
    AfterPost = FDMemTableAmigosAfterPost
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 352
    Top = 160
    object FDMemTableAmigosId: TIntegerField
      DisplayLabel = 'Identificador'
      FieldName = 'Id'
    end
    object FDMemTableAmigosNombre: TStringField
      DisplayWidth = 30
      FieldName = 'Nombre'
      Size = 100
    end
    object FDMemTableAmigosAlias: TStringField
      FieldName = 'Alias'
    end
    object FDMemTableAmigosTelefono: TStringField
      DisplayLabel = 'Tel'#233'fono'
      DisplayWidth = 15
      FieldName = 'Telefono'
    end
  end
  object DataSourceAmigos: TDataSource
    DataSet = FDMemTableAmigos
    Left = 349
    Top = 224
  end
  object FDStanStorageJSONLink: TFDStanStorageJSONLink
    Left = 349
    Top = 296
  end
  object FileOpenDialog: TFileOpenDialog
    DefaultExtension = '.ami'
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'Archivo de Amigos'
        FileMask = '*.ami'
      end>
    Options = [fdoPathMustExist]
    Title = 'Abrir archivo de amigos'
    Left = 61
    Top = 288
  end
  object FileSaveDialog: TFileSaveDialog
    DefaultExtension = '.ami'
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'Archivo de Amigos'
        FileMask = '*.ami'
      end>
    Options = [fdoOverWritePrompt]
    Title = 'Guardar archivo de amigos'
    Left = 61
    Top = 352
  end
end
