//------------------------------------------------------------------------------------------------------------
//********* Sobre ************
//Autor: Gisele de Melo
//Esse código foi desenvolvido com o intuito de aprendizado para o blog codedelphi.com, portanto não me
//responsabilizo pelo uso do mesmo.
//
//********* About ************
//Author: Gisele de Melo
//This code was developed for learning purposes for the codedelphi.com blog, therefore I am not responsible for
//its use.
//------------------------------------------------------------------------------------------------------------

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    ButtonInsert: TButton;
    ButtonUpdate: TButton;
    ButtonDelete: TButton;
    EditNome: TDBEdit;
    EditEmail: TDBEdit;
    EditTelefone: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    ADOTable1id: TAutoIncField;
    ADOTable1nome: TStringField;
    ADOTable1email: TStringField;
    ADOTable1telefone: TStringField;
    ButtonSave: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButtonInsertClick(Sender: TObject);
    procedure ButtonUpdateClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure HabilitarDesabilitar(Habilitar:Boolean);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ButtonSaveClick(Sender: TObject);
begin
  //Verifica se a tabela está em modo de inserção ou edição, caso esteja, salva o registro
  if (ADOTable1.State in [dsInsert, dsEdit]) then
  begin
    ADOTable1.Post;//Salva os dados no banco de dados
    HabilitarDesabilitar(False);//Desabilita os campos para digitar
    ShowMessage('Cliente salvo com sucesso!');//Exibe mensagem de sucesso.
  end;

end;

procedure TForm1.ButtonDeleteClick(Sender: TObject);
begin
  //Verifica se a tabela tem registros inseridos, para serem excluídos
  if not ADOTable1.IsEmpty then
  begin
    //faz uma pergunta para excluir o registro, caso responda sim, o registro será excluido
    if MessageDlg('Deseja realmente excluir este cliente?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      ADOTable1.Delete;// comando para deletar o registro
      ShowMessage('Cliente excluído com sucesso!');//Exibe mensagem de sucesso
    end;
  end;
end;

procedure TForm1.ButtonInsertClick(Sender: TObject);
begin
  //Verifica se o registro não está em modo de inserção ou edição
  if not (ADOTable1.State in [dsInsert, dsEdit]) then
  begin
    HabilitarDesabilitar(True);//Habilita os campos para digitar
    ADOTable1.Insert; //Prepara o componente ADOTable1 para inserir os registros na tabela tblClientes
    EditNome.SetFocus;//seta o foco na caixa de texto nome
  end;
end;

procedure TForm1.ButtonUpdateClick(Sender: TObject);
begin
  //Verifica se a tabela possui registros para alterar
  //e verifica se o registro não está em modo de inserção ou edição
  if (not ADOTable1.IsEmpty) and (not (ADOTable1.State in [dsInsert, dsEdit])) then
  begin
    HabilitarDesabilitar(True);//Habilita os campos para digitar
    ADOTable1.Edit;//Prepara o componente ADOTable1 para alterar os registros na tabela tblClientes
    EditNome.SetFocus;//seta o foco na caixa de texto nome
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ADOTable1.Close;//Fecha a conexão da tabela
  ADOConnection1.Connected := False;//Fecha a conexão do banco de dados
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //Configura a conexão com o MySql
  ADOConnection1.ConnectionString := 'Provider=MSDASQL.1;Persist Security Info=False;User ID=root;Data Source=MySql ODBC 32 Ansi;Initial Catalog=dbcrud;';
  ADOConnection1.DefaultDatabase := 'dbcrud';
  ADOConnection1.LoginPrompt := False;//seta o login prompt para falso, para não exibir a entrada de senha
  ADOConnection1.Connected := True; //Conecta o banco de dados

  ADOConnection1.Connected := True; //Ativa a conexão
  ADOTable1.Connection := ADOConnection1; //liga a conexão na tabela
  ADOTable1.TableName := 'tblClientes';//seta o nome da tabela
  ADOTable1.Active := True;//ativa a tabela

  DataSource1.DataSet := ADOTable1; //liga a tabela ao datasource
  DBGrid1.DataSource := DataSource1;//liga o datasource a grid

  HabilitarDesabilitar(False);//Desabilita os campos para digitar

end;

procedure TForm1.HabilitarDesabilitar(Habilitar:Boolean);
begin
  //Habilita e desabilita as caixas de texto de acordo com o parametro Habilitar
  EditNome.Enabled := Habilitar;
  EditEmail.Enabled := Habilitar;
  EditTelefone.Enabled := Habilitar;
end;

end.
