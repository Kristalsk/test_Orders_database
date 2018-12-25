unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Menus, Vcl.ComCtrls, Vcl.ToolWin, Vcl.DBCtrls, comObj;

type
  TfMain = class(TForm)
    gridOrders: TDBGrid;
    pnlHead: TPanel;
    tbEditOrders: TToolBar;
    ToolButton2: TToolButton;
    tbtnDeleteOrder: TToolButton;
    Splitter1: TSplitter;
    gridDetails: TDBGrid;
    dsOrders: TDataSource;
    dsDetails: TDataSource;
    ToolButton1: TToolButton;
    qryOrders: TADOQuery;
    qryOrdersDateSale: TDateTimeField;
    qryOrdersTotalPrice: TBCDField;
    qryOrdersDateIn: TDateTimeField;
    qryTemp: TADOQuery;
    tbtnAcceptOrder: TToolButton;
    qryOrdersc_name: TWideStringField;
    ToolBar1: TToolBar;
    btnAddGoods: TToolButton;
    btnDeleteGoods: TToolButton;
    qryOrderskod: TAutoIncField;
    qryOrderscustomerID: TIntegerField;
    qryOrderssaleflag: TIntegerField;
    qryOrdersdateout: TDateTimeField;
    qryOrderDetail: TADOQuery;
    qryOrderDetailkod: TAutoIncField;
    qryOrderDetailorderID: TIntegerField;
    qryOrderDetailGoodsID: TIntegerField;
    qryOrderDetailQuantity: TIntegerField;
    qryOrderDetailprice: TBCDField;
    qryOrderDetailTotal: TBCDField;
    qryOrderDetailg_name: TWideStringField;
    tbtnCreateReport: TToolButton;
    ToolButton4: TToolButton;
    tbtnAddOrder: TToolButton;
    btnEditGoods: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure tbtnAddOrderClick(Sender: TObject);
    procedure showAddEditForm(Sender: TObject);
    procedure CustomerAddFormClose(Sender: TObject; var Action: TCloseAction);
    procedure CustomerEditFormClose(Sender: TObject; var Action: TCloseAction);
    procedure GoodsAddFormClose(Sender: TObject; var Action: TCloseAction);
    procedure GoodsEditFormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridOrdersCellClick(Column: TColumn);
    procedure tbtnDeleteOrderClick(Sender: TObject);
    procedure tbtnAcceptOrderClick(Sender: TObject);
    procedure gridOrdersDblClick(Sender: TObject);
    procedure btnAddGoodsClick(Sender: TObject);
    procedure btnDeleteGoodsClick(Sender: TObject);
    procedure showEditDetail(Sender : TObject);
    procedure gridDetailsDblClick(Sender: TObject);
    procedure editDetailClose(Sender : TObject; var Action: TCloseAction);
    procedure tbtnCreateReportClick(Sender: TObject);
    Procedure ToExcel(query:TAdoquery; ExcelApp:Variant; BeginCol, BeginRow : integer);
    procedure btnEditGoodsClick(Sender: TObject);



  private
    { Private declarations }
    callChecker: string;
    xOrderID: integer;
    foo: TPoint;
  public
    { Public declarations }
  end;

var
  fMain: TfMain;



implementation
{$R *.dfm}


uses DataModule, AddEditForm, editDetail;



procedure TfMain.FormCreate(Sender: TObject);
begin

        fMain.Height := 458;
        fMain.Width := 660;

        formatSettings.DecimalSeparator := '.';
        Application.UpdateFormatSettings := False;

        qryOrders.SQL.Clear;
        qryOrders.SQL.Add('SELECT o.kod, o.customerID, ');
        qryOrders.SQL.Add('o.DateSale, o.datein, o.saleflag, ');
        qryOrders.SQL.Add('o.dateout, o.TotalPrice, c.name AS c_name ');
        qryOrders.SQL.Add('FROM orders o ');
        qryOrders.SQL.Add('LEFT JOIN Customer c  ON o.customerID = c.kod');
        qryOrders.SQL.Add('ORDER BY SaleFlag, DateSale DESC, DateIn DESC');
        qryOrders.Active:=True;
        qryOrders.first;

        xOrderID := qryOrders.FieldByName('kod').AsInteger;

        qryOrderDetail.SQL.Clear;
        qryOrderDetail.SQL.Add('SELECT od.kod, od.orderID, ');
        qryOrderDetail.SQL.Add('od.GoodsID, od.Quantity, od.price,');
        qryOrderDetail.SQL.Add('od.Total, g.name AS g_name  ');
        qryOrderDetail.SQL.Add('FROM orderDetail od ');
        qryOrderDetail.SQL.Add('LEFT JOIN Goods g  ON od.goodsID = g.kod ');
        qryOrderDetail.SQL.Add('WHERE od.orderID = :curOrderID');
        qryOrderDetail.Parameters.ParamByName('curOrderID').Value :=  xOrderID;
        qryOrderDetail.Active := true;

end;

procedure TfMain.gridDetailsDblClick(Sender: TObject);
var xGoodsID,xFlag, xRecCount: integer;
begin
  xFlag := qryOrders.FieldByName('saleFlag').AsInteger;
  xRecCount := qryOrders.RecordCount;
  callChecker := 'gridEditOrderDetail';
if xRecCount < 1 then
    Begin
      GetCursorPos(Foo);
      MessageDlgPos('Заказ отсутствует!', mtError, [mbOk],0,foo.x, foo.y);
    End
else if xFlag <> 1 then
  Begin
    if qryOrderDetail.RecordCount < 1 then
      btnAddGoods.Click
    else
      Begin
        callChecker := 'editGoods';
        showEditDetail(Self);
      End;

  End
    else
      begin
        GetCursorPos(Foo);
        MessageDlgPos('Изменить невозможно. Заказ проведён.', mtError, [mbOk],0,foo.x, foo.y);
      end;

end;

procedure TfMain.gridOrdersCellClick(Column: TColumn);
var xFlag: integer;
begin
   qryOrderDetail.Active := true;
   xFlag := qryOrders.FieldByName('saleFlag').AsInteger;
   xOrderID := qryOrders.FieldByName('kod').AsInteger;
   qryOrderDetail.Parameters.ParamByName('curOrderID').Value :=  xOrderID;
   qryOrderDetail.Requery();
if xFlag = 1 then
  begin
    btnAddGoods.Enabled := false;
    btnDeleteGoods.Enabled := false;
  end
else
  begin
    btnAddGoods.Enabled := true;
    btnDeleteGoods.Enabled := true;
  end;

end;

procedure TfMain.gridOrdersDblClick(Sender: TObject);
var xFlag, xRecCount: integer;
begin
callChecker := 'gridEditOrder';
xFlag := qryOrders.FieldByName('saleFlag').AsInteger;
xRecCount := qryOrders.RecordCount;
if xRecCount < 1 then
  Begin
   tbtnAddOrder.Click;
  End
Else if xFlag <> 1 then
showAddEditForm(self)
else
begin
  GetCursorPos(Foo);
  MessageDlgPos('Изменить невозможно. Заказ проведён.', mtError, [mbOk],0,foo.x, foo.y);
  end;
end;

procedure TfMain.tbtnAddOrderClick(Sender: TObject);
begin
callChecker := 'btnAddOrder';
showAddEditForm(self);
end;





procedure TfMain.tbtnDeleteOrderClick(Sender: TObject);
var xCheck, xID :integer;
begin
xCheck := qryOrders.FieldByName('saleFlag').AsInteger;
xID := qryOrders.FieldByName('KOD').AsInteger;
if xcheck <> 1  then
  begin
    qryTemp.SQL.Clear;
    qryTemp.SQL.Add('DELETE FROM Orders WHERE KOD =');
    qryTemp.SQL.Add(IntToStr(xId));
    qryTemp.ExecSQL;
    qryOrders.Requery();
    gridOrders.SelectedRows.CurrentRowSelected:=true;
    xOrderID := qryOrders.FieldByName('kod').AsInteger;
    qryOrderDetail.Parameters.ParamByName('curOrderID').Value :=  xOrderID;
    qryOrderDetail.Requery();

  end
else
  begin
  GetCursorPos(Foo);
  MessageDlgPos('Удалить невозможно. Заказ проведён.', mtError, [mbOk],0,foo.x, foo.y);
  end;

end;

procedure TfMain.tbtnAcceptOrderClick(Sender: TObject);
  var xID, testFlag :integer;
begin
  xID := qryOrders.FieldByName('KOD').AsInteger;
  testFlag := qryOrders.FieldByName('saleFlag').AsInteger;
if testFlag <> 1 then
  begin
    qryTemp.SQL.Clear;
    qryTemp.SQL.Add('UPDATE Orders SET saleFlag = 1 WHERE Kod=');
    qryTemp.SQL.Add(IntToStr(xId));
    qryTemp.ExecSQL;
    qryOrders.Requery();
    qryOrders.Locate('Kod', xId, []);
    gridOrders.SelectedRows.CurrentRowSelected:=true;
    qryOrderDetail.Parameters.ParamByName('curOrderID').Value :=  xOrderID;
    qryOrderDetail.Requery();

  end
else
  begin
  GetCursorPos(Foo);
  MessageDlgPos('Заказ уже проведён.', mtError, [mbOk],0,foo.x, foo.y);
  end;
end;

procedure TfMain.showAddEditForm(Sender : TObject);
var xModal: TfAddEditModal; xcurID, xcurOrderID:integer;
begin
   xModal:= TfAddEditModal.Create(Application);
    try
     If callChecker = 'btnAddOrder' then
            begin
             xModal.OnClose:= CustomerAddFormClose;
             xModal.Caption:= 'Добавить заказчика';
             xModal.qryAddEditOrder.SQL.TEXT := 'SELECT * FROM Customer WHERE Kod >1';
             xModal.qryAddEditOrder.Active := true;
             xModal.gridAddEditOrders.Visible := true;
            end
    Else If callChecker = 'gridEditOrder' then
            begin
             xModal.OnClose:= CustomerEditFormClose;
             xModal.Caption:= 'Изменить заказчика на...';
             xcurID := qryOrders.FieldByName('customerID').AsInteger;
             xModal.qryAddEditOrder.Close;
             xModal.qryAddEditOrder.SQL.Clear;
             xModal.qryAddEditOrder.SQL.add('SELECT * FROM CUSTOMER WHERE Kod <>');
             xModal.qryAddEditOrder.SQL.Add(IntToStr(xcurID));
             xModal.qryAddEditOrder.SQL.Add(' AND Kod >1');
             xModal.qryAddEditOrder.Active := true;
             xModal.gridAddEditOrders.Visible := true;
            end
    Else If callChecker ='btnAddGoods' then
            begin
             xModal.OnClose:= GoodsAddFormClose;
             xModal.Caption:= 'Добавить товар';
             xcurOrderID := qryOrderDetail.FieldByName('orderID').AsInteger;
             xModal.qryAddEditGoods.Close;
             xModal.qryAddEditGoods.SQL.Clear;
             xModal.qryAddEditGoods.SQL.add('SELECT * FROM GOODS g ');
             xModal.qryAddEditGoods.SQL.Add('LEFT JOIN (SELECT GoodsID FROM OrderDetail WHERE OrderID =');
             xModal.qryAddEditGoods.SQL.Add(IntToStr(xcurOrderID));
             xModal.qryAddEditGoods.SQL.Add(') as od ON od.goodsID = g.Kod');
             xModal.qryAddEditGoods.SQL.Add('WHERE od.GoodsID is NULL');
             xModal.qryAddEditGoods.Active := true;
             xModal.gridAddEditGoods.Visible := true;
            end
    Else If callChecker ='editGoods' then
            begin
             xModal.OnClose:= GoodsEditFormClose;
             xModal.Caption:= 'Изменить товар на...';
             xcurOrderID := qryOrderDetail.FieldByName('orderID').AsInteger;
             xModal.qryAddEditGoods.Close;
             xModal.qryAddEditGoods.SQL.Clear;
             xModal.qryAddEditGoods.SQL.add('SELECT * FROM GOODS g ');
             xModal.qryAddEditGoods.SQL.Add('LEFT JOIN (SELECT GoodsID FROM OrderDetail WHERE OrderID =');
             xModal.qryAddEditGoods.SQL.Add(IntToStr(xcurOrderID));
             xModal.qryAddEditGoods.SQL.Add(') as od ON od.goodsID = g.Kod');
             xModal.qryAddEditGoods.SQL.Add('WHERE od.GoodsID is NULL');
             xModal.qryAddEditGoods.Active := true;
             xModal.gridAddEditGoods.Visible := true;

            end;
        xModal.ShowModal;
    finally
        xModal.Free;
    end;

end;



procedure TfMain.showEditDetail(Sender : TObject);
var xEditDetail: TfEditDetail; xQty, xPrice: Double;
begin
   xEditDetail:= TfEditDetail.Create(Application);
   xQty:= qryOrderDetail.FieldByName('Quantity').AsFloat;
   xPrice:= qryOrderDetail.FieldByName('Price').AsFloat;
  try
        GetCursorPos(Foo);
        xEditDetail.Top := Foo.Y;
        xEditDetail.Left := foo.X;
        xEditDetail.etQty.Text := FloatToStr(xQty);
        xEditDetail.etPrice.Text := FloatToStr(xPrice);
        xEditDetail.OnClose := editDetailClose;
        xEditDetail.ShowModal;
  finally
        xEditDetail.Free;
  end;

end;


procedure Tfmain.editDetailClose(Sender : TObject; var Action: TCloseAction);
  var
    xPrice, xTotal: real;
    xIdGoods, xIdOrder, xQty :integer;

begin
 if TfEditDetail(Sender).ModalResult <> mrOk then
    begin
      Action := caFree;
      Exit;
    end;
  try
      xQty:= StrToInt(TfEditDetail(Sender).etQty.Text);
      xPrice:= StrToFloat(TfEditDetail(Sender).etPrice.Text);
      xTotal:= xQty*xPrice;
      xIdGoods := qryOrderDetail.FieldByName('Kod').AsInteger;
      xIdOrder := qryOrders.FieldByName('Kod').AsInteger;
      qryTemp.SQL.Clear;
      qryTemp.SQL.Add('UPDATE OrderDetail SET Quantity =');
      qryTemp.SQL.Add(IntToStr(xQty));
      qryTemp.SQL.Add(', Price =');
      qryTemp.SQL.Add(FloatToStr(xPrice));
      qryTemp.SQL.Add(', Total =');
      qryTemp.SQL.Add(FloatToStr(xTotal));
      qryTemp.SQL.Add(' WHERE Kod=');
      qryTemp.SQL.Add(IntToStr(xIdGoods));
      qryTemp.ExecSQL;
      qryOrderDetail.Requery();
      qryOrders.Requery();
      qryOrders.Locate('Kod', xIdOrder, []);
      qryOrderDetail.Locate('Kod', xIdGoods, []);
      gridOrders.SelectedRows.CurrentRowSelected:=true;
      gridDetails.SelectedRows.CurrentRowSelected:=true;

  finally
    Action := caFree;
  end;

end;

procedure TfMain.btnAddGoodsClick(Sender: TObject);
var xsaleFlag : integer;
begin
callChecker := 'btnAddGoods';
xsaleFlag := qryOrders.FieldByName('saleFlag').AsInteger;
if xsaleFlag <> 1 then
  Begin
    if qryOrders.RecordCount > 0 then
      begin
        showAddEditForm(self);
        showEditDetail(self);
      end
    else
        begin
          GetCursorPos(Foo);
          MessageDlgPos('Заказ отсутствует!', mtError, [mbOk],0,foo.x, foo.y);
        end;

  End
Else
  Begin
    GetCursorPos(Foo);
    MessageDlgPos('Невозможная операция. Заказ уже проведён!', mtError, [mbOk],0,foo.x, foo.y);
  End;


end;

procedure TfMain.btnDeleteGoodsClick(Sender: TObject);
var xID :integer;
begin
xID := qryOrderDetail.FieldByName('KOD').AsInteger;
    qryTemp.SQL.Clear;
    qryTemp.SQL.Add('DELETE FROM OrderDetail WHERE KOD =');
    qryTemp.SQL.Add(IntToStr(xId));
    qryTemp.ExecSQL;
    qryOrderDetail.Requery();
end;


procedure TfMain.btnEditGoodsClick(Sender: TObject);
var xFlag, xRecCount: integer;
begin
callChecker := 'editGoods';
xFlag := qryOrders.FieldByName('saleFlag').AsInteger;
xRecCount := qryOrderDetail.RecordCount;
if xRecCount < 1 then
  Begin
   GetCursorPos(Foo);
   MessageDlgPos('Товар в заказе отсутствует!', mtError, [mbOk],0,foo.x, foo.y);
  End
Else if xFlag <> 1 then
  Begin
    showAddEditForm(self);
    showEditDetail(self);
  End
else
  begin
    GetCursorPos(Foo);
    MessageDlgPos('Изменить невозможно. Заказ проведён.', mtError, [mbOk],0,foo.x, foo.y);
    end;
  end;

procedure Tfmain.CustomerAddFormClose(Sender : TObject; var Action: TCloseAction);
  var xIdAddCustomer, xIdOrder: integer;
begin
 if TfAddEditModal(Sender).ModalResult <> mrOk then
    begin
      Action := caFree;
      Exit;
    end;
  try
      xIdAddCustomer:= TfAddEditModal(Sender).qryAddEditOrder.FieldByName('Kod').AsInteger;
      qryOrders.Insert;
      qryOrders.FieldByName('CustomerID').AsInteger := xIdAddCustomer;
      qryOrders.Post;
      xIdOrder := qryOrders.FieldByName('Kod').AsInteger;
      qryOrders.Requery();

  finally
    TfAddEditModal(Sender).qryAddEditOrder.close;
    TfAddEditModal(Sender).gridAddEditOrders.Visible := false;
    qryOrders.Locate('Kod', xIdOrder, []);
    gridOrders.SelectedRows.CurrentRowSelected:=true;
    xOrderID := qryOrders.FieldByName('kod').AsInteger;
    qryOrderDetail.Parameters.ParamByName('curOrderID').Value :=  xOrderID;
    qryOrderDetail.Requery();
    Action := caFree;
  end;
end;

procedure Tfmain.GoodsAddFormClose(Sender : TObject; var Action: TCloseAction);
  var xIDGoods, xIdCurOrder, xNewGoodsID: integer;
begin
 if TfAddEditModal(Sender).ModalResult <> mrOk then
    begin
      Action := caFree;
      Exit;
    end;
  try
      xIDGoods:= TfAddEditModal(Sender).qryAddEditGoods.FieldByName('Kod').AsInteger;
      xIdCurOrder := qryOrders.FieldByName('Kod').AsInteger;
      qryOrderDetail.Insert;
      qryOrderDetail.FieldByName('orderID').AsInteger := xIdCurOrder;
      qryOrderDetail.FieldByName('goodsID').AsInteger := xIDGoods;
      qryOrderDetail.FieldByName('Total').AsInteger := 0;
      qryOrderDetail.Post;
      xNewGoodsID:= qryOrderDetail.FieldByName('Kod').AsInteger;
      qryOrderDetail.Requery();
      qryOrderDetail.Locate('Kod',xNewGoodsID,[]);
      gridDetails.SelectedRows.CurrentRowSelected:=true;
  finally
    TfAddEditModal(Sender).qryAddEditGoods.close;
    TfAddEditModal(Sender).gridAddEditGoods.Visible := false;
    TfAddEditModal(Sender).qryAddEditGoods.close;
    TfAddEditModal(Sender).gridAddEditGoods.Visible := false;
    Action := caFree;
  end;

end;

procedure Tfmain.CustomerEditFormClose(Sender : TObject; var Action: TCloseAction);
  var xIdOrder, xNewIDCustomer: integer;
begin
 if TfAddEditModal(Sender).ModalResult <> mrOk then
    begin
      Action := caFree;
      Exit;
    end;
  try
      xNewIDCustomer:= TfAddEditModal(Sender).qryAddEditOrder.FieldByName('Kod').AsInteger;
      xIdOrder := qryOrders.FieldByName('Kod').AsInteger;
      qryTemp.SQL.Clear;
      qryTemp.SQL.Add('UPDATE Orders SET customerID =');
      qryTemp.SQL.Add(IntToStr(xNewIDCustomer));
      qryTemp.SQL.Add(' WHERE Kod=');
      qryTemp.SQL.Add(IntToStr(xIdOrder));
      qryTemp.ExecSQL;
      qryOrders.Requery();
      qryOrders.Locate('Kod', xIdOrder, []);
  finally
    TfAddEditModal(Sender).qryAddEditOrder.close;
    TfAddEditModal(Sender).gridAddEditOrders.Visible := false;
    qryOrders.Locate('Kod', xIdOrder, []);
    gridOrders.SelectedRows.CurrentRowSelected:=true;
    Action := caFree;
  end;

end;







procedure Tfmain.GoodsEditFormClose(Sender : TObject; var Action: TCloseAction);
  var xIdGoods, xNewIDGoods, xorderID, xDetailID: integer;
begin
 if TfAddEditModal(Sender).ModalResult <> mrOk then
    begin
      Action := caFree;
      Exit;
    end;
  try
      xNewIDGoods:= TfAddEditModal(Sender).qryAddEditGoods.FieldByName('Kod').AsInteger;
      xIdGoods := qryOrderDetail.FieldByName('Kod').AsInteger;
      xorderID := qryOrderDetail.FieldByName('orderID').AsInteger;
      xDetailID := qryOrderDetail.FieldByName('Kod').AsInteger;
      qryTemp.SQL.Clear;
      qryTemp.SQL.Add('UPDATE OrderDetail SET GoodsID =');
      qryTemp.SQL.Add(IntToStr(xNewIDGoods));
      qryTemp.SQL.Add(' WHERE Kod=');
      qryTemp.SQL.Add(IntToStr(xIdGoods));
      qryTemp.ExecSQL;
      qryOrderDetail.Requery();
      qryOrderDetail.Locate('Kod', xDetailID, []);
      gridDetails.SelectedRows.CurrentRowSelected:=true;

  finally
    TfAddEditModal(Sender).qryAddEditGoods.close;
    TfAddEditModal(Sender).gridAddEditGoods.Visible := false;
    Action := caFree;
  end;

end;

 procedure TfMain.tbtnCreateReportClick(Sender: TObject);
 var
 curOrderID, wCol, j, RowCount, ColCount, BeginCol, BeginRow : integer;
 XLApp, XlBook, Sheet, Colum, Range, cellSum, cellSum1, cellSum2:Variant;
 rangeAddressSum, strHead: string;
begin
  curOrderID := qryOrders.FieldByName('Kod').AsInteger;
  BeginCol := 2;
  BeginRow := 4;
  wCol := 15;
  strHead := 'Расходная накладная №2'+qryOrders.FieldByName('Kod').AsString;
  XLApp:=CreateOLEObject('Excel.Application');
  XlBook := XLApp.Workbooks.Add;
  XLApp.Visible:= false;
  XLApp.DisplayAlerts := false;
  Colum:=XlBook.WorkSheets[1].Columns;

  qryTemp.SQL.Clear;
  qryTemp.SQL.ADD('SELECT od.GoodsID, g.Name, od.quantity, od.price, od.Total');
  qryTemp.SQL.ADD('FROM OrderDetail od ');
  qryTemp.SQL.ADD('JOIN Goods g ON od.GoodsID = g.Kod ');
  qryTemp.SQL.ADD('WHERE od.orderID =');
  qryTemp.SQL.ADD(IntToStr(curOrderID));
  qryTemp.SQL.ADD(' ORDER BY g.Name');
  qryTemp.open;

  RowCount := qryTemp.RecordCount;
  ColCount := qryTemp.FieldCount;

   Colum.Columns[1].ColumnWidth := 3;
  for j:=2 to qryTemp.FieldCount+1 do
   Colum.Columns[j].ColumnWidth := wCol;

  Sheet:=XlBook.WorkSheets[1];
    Sheet.Cells[2,3]:=strHead;
    Sheet.Cells[3,2]:='Товар';
    Sheet.Cells[3,3]:='Название';
    Sheet.Cells[3,4]:='Кол-во';
    Sheet.Cells[3,5]:='Цена';
    Sheet.Cells[3,6]:='Сумма';
    Sheet.Cells[3,6]:='Сумма';
    Sheet.Cells[BeginRow  + RowCount, BeginCol + ColCount - 1] := 'Итого сумма:';
    Sheet.Cells[BeginRow  + RowCount, BeginCol + ColCount - 1].HorizontalAlignment := 4;
    Sheet.Cells[BeginRow  + RowCount, BeginCol + ColCount - 1].Font.Bold := true;
    Sheet.Cells[BeginRow  + RowCount, BeginCol + ColCount - 1].Font.Size := 12;
    cellSum :=  Sheet.Cells[BeginRow + RowCount,  BeginCol + ColCount];
    cellSum.HorizontalAlignment := 2;
    cellSum.Font.Size := 12;
    cellSum1 := Sheet.Cells[BeginRow,  BeginCol + ColCount-1];
    cellSum2 := Sheet.Cells[BeginRow + RowCount-1,  BeginCol + ColCount-1];
    cellSum2.select;
    rangeAddressSum := cellSum1.address +':'+ cellSum2.address;
    cellSum.FormulaLocal := '=SUM('+rangeAddressSum+')';

  Range := Sheet.Range['B3:F3'];
  Range.select;
  Range.Borders.LineStyle := 1;
  Range.Borders.Weight := 2;
  Range.interior.color :=  ColorToRGB(clSilver);
  Range := Sheet.Range['B2:F2'];
  Range.select;
  Range.MergeCells:=True;
  Range.font.size := 14;
  Range := Sheet.Range['B2:F3'];
  Range.select;
  Range.font.bold := true;
  Range:=Unassigned;

  Sheet.Columns[5].numberFormat := '0,00';
  Sheet.Columns[6].numberFormat := '0,00';
  Sheet.Columns[7].numberFormat := '0,00';
  ToExcel(qryTemp,XLApp, BeginCol, BeginRow);
  XLApp:=Unassigned;

end;

Procedure tfmain.ToEXcel(query:TAdoquery; ExcelApp: Variant; BeginCol, BeginRow : integer);

var
    Workbook, Range, Cell1, Cell2, ArrayData : Variant;
    RowCount, ColCount, i,j : integer;
begin

  RowCount := 0;
  ColCount := 0;

  ExcelApp.Application.EnableEvents := false;

  ExcelApp.DisplayAlerts := false;
  Workbook := ExcelApp.WorkBooks[1];

  RowCount := query.RecordCount;
  ColCount := query.FieldCount;
  ArrayData := VarArrayCreate([1, RowCount, 1, ColCount], varVariant);

query.First;
query.DisableControls;

for I := 1 to RowCount do
  begin
  for j := 0 to ColCount - 1 do
  begin
  if (query.Fields.Fields[j].AsVariant <> null) then
    ArrayData[I, j+1] := trimright(query.Fields.Fields[j].AsVariant)
  else
      ArrayData[I, j+1] := '';

  end;
  query.Next;
end;
query.EnableControls;
  ExcelApp.cells[1,1].select;

  Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow, BeginCol];

  Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow  + RowCount - 1, BeginCol + ColCount - 1];
  Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
  Range.select;

  ExcelApp.Selection.Borders.LineStyle := 1;
  ExcelApp.Selection.Borders.Weight := 2;
  Range.Value := ArrayData;

  ExcelApp.ActiveSheet.PageSetup.Orientation := 2;
  Range:=Unassigned;
  Range := WorkBook.WorkSheets[1].Range['A1', Cell2];
  Range.select;
  Range.HorizontalAlignment:=3;
  Range:=Unassigned;
  ExcelApp.cells[1,1].select;
  ExcelApp.Visible := true;
  Workbook:=Unassigned;
  Range:=Unassigned;
  Cell1:=Unassigned;
  Cell2:=Unassigned;
  ArrayData:=Unassigned;
end;

end.
