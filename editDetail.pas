unit editDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfEditDetail = class(TForm)
    lbQty: TLabel;
    lbPrice: TLabel;
    etQty: TEdit;
    etPrice: TEdit;
    bbtnOk: TBitBtn;
    procedure etQtyKeyPress(Sender: TObject; var Key: Char);
    procedure etPriceKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnOkKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEditDetail: TfEditDetail;

implementation

{$R *.dfm}

uses DataModule, MainForm;

procedure TfEditDetail.bbtnOkKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  Begin
   key := #0;
  End;
end;

procedure TfEditDetail.etPriceKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  Begin
   key := #0;
   bbtnOk.Click;
  End;
end;

procedure TfEditDetail.etQtyKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  Begin
   key := #0;
   etPrice.SetFocus;
  End;

end;



end.
