unit FPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormPrincipal = class(TForm)
    EditNombre: TEdit;
    LabelNombre: TLabel;
    ButtonSaludar: TButton;
    procedure ButtonSaludarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

procedure TFormPrincipal.ButtonSaludarClick(Sender: TObject);
begin
  ShowMessage('Hola ' + EditNombre.Text);
end;

end.
