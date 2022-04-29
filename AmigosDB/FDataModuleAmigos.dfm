object DataModuleAmigos: TDataModuleAmigos
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object SQLConnection: TSQLConnection
    DriverName = 'Interbase'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXInterBase'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver280.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXInterbaseMetaDataCommandFactory,DbxInt' +
        'erBaseDriver280.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXInterbaseMetaDataCommand' +
        'Factory,Borland.Data.DbxInterBaseDriver,Version=24.0.0.0,Culture' +
        '=neutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxint.dll'
      'LibraryNameOsx=libsqlib.dylib'
      'VendorLib=GDS32.DLL'
      'VendorLibWin64=ibclient64.dll'
      'VendorLibOsx=libgds.dylib'
      'Database=C:\repos\DelphiBasico\AmigosDB\Data\AMIGOS.IDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'DisplayDriverName=InterBase Server'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False'
      'SEP=')
    Left = 104
    Top = 96
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\repos\DelphiBasico\AmigosDB\Data\AMIGOS.IDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=localhost'
      'DriverID=IB')
    LoginPrompt = False
    Left = 104
    Top = 32
  end
  object FDTableaAmigo: TFDTable
    IndexFieldNames = 'ID'
    Connection = FDConnection
    TableName = 'AMIGO'
    Left = 232
    Top = 32
    object FDTableaAmigoID: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Identificador'
      FieldName = 'ID'
      Origin = 'ID'
    end
    object FDTableaAmigoNOMBRE: TStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Origin = 'NOMBRE'
      Size = 100
    end
    object FDTableaAmigoALIAS: TStringField
      DisplayLabel = 'Alias'
      FieldName = 'ALIAS'
      Origin = 'ALIAS'
    end
    object FDTableaAmigoTELEFONO: TStringField
      DisplayLabel = 'Tel'#233'fono'
      FieldName = 'TELEFONO'
      Origin = 'TELEFONO'
    end
  end
  object FDQueryContar: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select count(*) as cantidad from amigo')
    Left = 368
    Top = 32
    object FDQueryContarCANTIDAD: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
      Origin = 'CANTIDAD'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
