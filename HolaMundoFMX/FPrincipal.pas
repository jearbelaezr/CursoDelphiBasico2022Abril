unit FPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation;

type
  TFormPrincipal = class(TForm)
    LabelNombre: TLabel;
    EditNombre: TEdit;
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

{$R *.fmx}

procedure TFormPrincipal.ButtonSaludarClick(Sender: TObject);
begin
  ShowMessage('Hola ' + EditNombre.Text);
end;

end.
