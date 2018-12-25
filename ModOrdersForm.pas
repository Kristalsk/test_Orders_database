unit ModOrdersForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB;

type
  TfModOrder = class(TForm)
    pnlHead: TPanel;
    gbxCustomer: TGroupBox;
    cmbCustomers: TComboBox;
    qryOrderDetails: TADOQuery;
    dsOrderDetails: TDataSource;
    gridOrderDetail: TDBGrid;


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fModOrder: TfModOrder;

implementation

{$R *.dfm}

uses DataModule, MainForm;




end.
