unit AddEditForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons;

type
  TfAddEditModal = class(TForm)
    gridAddEditOrders: TDBGrid;
    qryAddEditOrder: TADOQuery;
    dsAddEditOrders: TDataSource;
    BitBtn1: TBitBtn;
    qryAddEditGoods: TADOQuery;
    dsAddEditGoods: TDataSource;
    gridAddEditGoods: TDBGrid;
    procedure gridAddEditOrdersDblClick(Sender: TObject);
    procedure gridAddEditGoodsDblClick(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  fAddEditModal: TfAddEditModal;

implementation

{$R *.dfm}

uses DataModule, MainForm;




procedure TfAddEditModal.gridAddEditGoodsDblClick(Sender: TObject);
begin
 BitBtn1.Click;
end;

procedure TfAddEditModal.gridAddEditOrdersDblClick(Sender: TObject);
begin
 BitBtn1.Click;
end;




end.
