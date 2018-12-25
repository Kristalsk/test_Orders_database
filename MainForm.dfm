object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'TEST Komarov'
  ClientHeight = 458
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 242
    Width = 635
    Height = 5
    Cursor = crVSplit
    Align = alTop
    ExplicitTop = 241
    ExplicitWidth = 563
  end
  object gridOrders: TDBGrid
    Left = 0
    Top = 69
    Width = 635
    Height = 173
    Align = alTop
    DataSource = dsOrders
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = gridOrdersCellClick
    OnDblClick = gridOrdersDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'kod'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1076
        Title.Color = clGradientActiveCaption
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'customerID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'c_name'
        Title.Alignment = taCenter
        Title.Caption = #1047#1072#1082#1072#1079#1095#1080#1082
        Title.Color = clGradientActiveCaption
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DateIn'
        Title.Alignment = taCenter
        Title.Caption = #1057#1086#1079#1076#1072#1085
        Title.Color = clGradientActiveCaption
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DateSale'
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1086#1074#1077#1076#1105#1085
        Title.Color = clGradientActiveCaption
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TotalPrice'
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1084#1084#1072
        Title.Color = clGradientActiveCaption
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dateout'
        Title.Alignment = taCenter
        Title.Color = clGradientActiveCaption
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'saleflag'
        Title.Alignment = taCenter
        Title.Caption = #1057#1090#1072#1090#1091#1089
        Title.Color = clGradientActiveCaption
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = False
      end>
  end
  object pnlHead: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 33
    Align = alTop
    Caption = #1046#1091#1088#1085#1072#1083' "'#1047#1072#1082#1072#1079#1099'"'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object tbEditOrders: TToolBar
    Left = 0
    Top = 33
    Width = 635
    Height = 36
    ButtonHeight = 38
    ButtonWidth = 39
    Caption = 'tbEditOrders'
    Images = DataModule2.ImageList1
    List = True
    TabOrder = 2
    Transparent = True
    object tbtnAddOrder: TToolButton
      Left = 0
      Top = 0
      Caption = 'Add'
      ImageIndex = 0
      OnClick = tbtnAddOrderClick
    end
    object ToolButton2: TToolButton
      Left = 39
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object tbtnDeleteOrder: TToolButton
      Left = 47
      Top = 0
      Caption = 'Del'
      ImageIndex = 1
      OnClick = tbtnDeleteOrderClick
    end
    object ToolButton1: TToolButton
      Left = 86
      Top = 0
      Width = 21
      Caption = 'ToolButton1'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object tbtnAcceptOrder: TToolButton
      Left = 107
      Top = 0
      Caption = 'tbtnAcceptOrder'
      ImageIndex = 2
      OnClick = tbtnAcceptOrderClick
    end
    object ToolButton4: TToolButton
      Left = 146
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object tbtnCreateReport: TToolButton
      Left = 154
      Top = 0
      Caption = 'tbtnCreateReport'
      ImageIndex = 3
      OnClick = tbtnCreateReportClick
    end
  end
  object gridDetails: TDBGrid
    Left = 39
    Top = 247
    Width = 596
    Height = 211
    Align = alClient
    DataSource = dsDetails
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = gridDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'kod'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1076
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'GoodsID'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1040#1088#1090#1080#1082#1091#1083
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'g_name'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
        Title.Color = clMoneyGreen
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Title.Color = clMoneyGreen
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'price'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072'  ('#1077#1076'.)'
        Title.Color = clMoneyGreen
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1048#1090#1086#1075#1086
        Title.Color = clMoneyGreen
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'orderID'
        ReadOnly = True
        Visible = False
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 247
    Width = 39
    Height = 211
    Align = alLeft
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 39
    Caption = 'ToolBar1'
    Images = DataModule2.ImageList1
    TabOrder = 4
    object btnAddGoods: TToolButton
      Left = 0
      Top = 0
      Caption = 'btnAddGoods'
      ImageIndex = 4
      Wrap = True
      OnClick = btnAddGoodsClick
    end
    object btnEditGoods: TToolButton
      Left = 0
      Top = 38
      ImageIndex = 5
      Wrap = True
      OnClick = btnEditGoodsClick
    end
    object btnDeleteGoods: TToolButton
      Left = 0
      Top = 76
      Caption = 'btnDeleteGoods'
      ImageIndex = 6
      OnClick = btnDeleteGoodsClick
    end
  end
  object dsOrders: TDataSource
    DataSet = qryOrders
    Left = 520
    Top = 128
  end
  object dsDetails: TDataSource
    DataSet = qryOrderDetail
    Left = 528
    Top = 352
  end
  object qryOrders: TADOQuery
    Connection = DataModule2.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 520
    Top = 80
    object qryOrdersc_name: TWideStringField
      DisplayWidth = 40
      FieldName = 'c_name'
    end
    object qryOrdersDateSale: TDateTimeField
      FieldName = 'DateSale'
    end
    object qryOrdersTotalPrice: TBCDField
      FieldName = 'TotalPrice'
      Precision = 19
    end
    object qryOrdersDateIn: TDateTimeField
      FieldName = 'DateIn'
    end
    object qryOrderskod: TAutoIncField
      FieldName = 'kod'
      ReadOnly = True
    end
    object qryOrderscustomerID: TIntegerField
      FieldName = 'customerID'
    end
    object qryOrderssaleflag: TIntegerField
      FieldName = 'saleflag'
    end
    object qryOrdersdateout: TDateTimeField
      FieldName = 'dateout'
    end
  end
  object qryTemp: TADOQuery
    Connection = DataModule2.MainConnection
    Parameters = <>
    Left = 520
    Top = 184
  end
  object qryOrderDetail: TADOQuery
    Connection = DataModule2.MainConnection
    CursorType = ctStatic
    Parameters = <
      item
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      ''
      ''
      '')
    Left = 528
    Top = 296
    object qryOrderDetailkod: TAutoIncField
      FieldName = 'kod'
    end
    object qryOrderDetailg_name: TWideStringField
      FieldName = 'g_name'
    end
    object qryOrderDetailorderID: TIntegerField
      FieldName = 'orderID'
    end
    object qryOrderDetailGoodsID: TIntegerField
      FieldName = 'GoodsID'
    end
    object qryOrderDetailQuantity: TIntegerField
      FieldName = 'Quantity'
      KeyFields = 'Quantity'
    end
    object qryOrderDetailprice: TBCDField
      FieldName = 'price'
      Precision = 19
    end
    object qryOrderDetailTotal: TBCDField
      FieldName = 'Total'
      Precision = 19
    end
  end
end
