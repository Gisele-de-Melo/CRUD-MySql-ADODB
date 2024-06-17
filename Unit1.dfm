object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'CRUD Simples'
  ClientHeight = 561
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 33
    Height = 15
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 34
    Height = 15
    Caption = 'e-mail'
  end
  object Label3: TLabel
    Left = 8
    Top = 72
    Width = 44
    Height = 15
    Caption = 'Telefone'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 154
    Width = 768
    Height = 399
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Width = 272
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'email'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'telefone'
        Visible = True
      end>
  end
  object ButtonInsert: TButton
    Left = 7
    Top = 123
    Width = 75
    Height = 25
    Caption = 'Inserir'
    TabOrder = 3
    OnClick = ButtonInsertClick
  end
  object ButtonUpdate: TButton
    Left = 88
    Top = 123
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 4
    OnClick = ButtonUpdateClick
  end
  object ButtonDelete: TButton
    Left = 169
    Top = 123
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 5
    OnClick = ButtonDeleteClick
  end
  object EditNome: TDBEdit
    Left = 56
    Top = 8
    Width = 241
    Height = 23
    DataField = 'nome'
    DataSource = DataSource1
    TabOrder = 0
  end
  object EditEmail: TDBEdit
    Left = 56
    Top = 40
    Width = 241
    Height = 23
    DataField = 'email'
    DataSource = DataSource1
    TabOrder = 1
  end
  object EditTelefone: TDBEdit
    Left = 56
    Top = 72
    Width = 239
    Height = 23
    DataField = 'telefone'
    DataSource = DataSource1
    TabOrder = 2
  end
  object ButtonSave: TButton
    Left = 250
    Top = 123
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 7
    OnClick = ButtonSaveClick
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;User ID=root;Data' +
      ' Source=MySql ODBC 32 Ansi;Initial Catalog=dbcrud;'
    DefaultDatabase = 'dbcrud'
    Provider = 'MSDASQL.1'
    Left = 456
    Top = 8
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'tblclientes'
    Left = 544
    Top = 8
    object ADOTable1id: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object ADOTable1nome: TStringField
      FieldName = 'nome'
      Size = 255
    end
    object ADOTable1email: TStringField
      FieldName = 'email'
      Size = 255
    end
    object ADOTable1telefone: TStringField
      FieldName = 'telefone'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 608
    Top = 8
  end
end
