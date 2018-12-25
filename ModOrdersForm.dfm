object fModOrder: TfModOrder
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 390
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHead: TPanel
    Left = 0
    Top = 0
    Width = 478
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 112
    ExplicitTop = 40
    ExplicitWidth = 185
    object gbxCustomer: TGroupBox
      Left = 1
      Top = 1
      Width = 185
      Height = 39
      Align = alLeft
      Caption = #1047#1072#1082#1072#1079#1095#1080#1082
      TabOrder = 0
      ExplicitLeft = 8
      ExplicitTop = 0
      ExplicitHeight = 105
      object cmbCustomers: TComboBox
        Left = 2
        Top = 15
        Width = 181
        Height = 21
        Align = alClient
        TabOrder = 0
        Text = 'cmbCustomers'
        ExplicitLeft = 96
        ExplicitTop = 16
        ExplicitWidth = 145
      end
    end
  end
  object gridOrderDetail: TDBGrid
    Left = 0
    Top = 41
    Width = 478
    Height = 349
    Align = alClient
    DataSource = dsOrderDetails
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'GoodsID'
        Title.Alignment = taCenter
        Title.Caption = #1058#1086#1074#1072#1088
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
        FieldName = 'quantity'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083'-'#1074#1086
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
        FieldName = 'price'
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072
        Title.Color = clGradientActiveCaption
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total'
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1084#1084#1072
        Title.Color = clGradientActiveCaption
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 60
        Visible = True
      end>
  end
  object qryOrderDetails: TADOQuery
    Connection = DataModule2.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select*from orderdetail ')
    Left = 360
    Top = 224
  end
  object dsOrderDetails: TDataSource
    DataSet = qryOrderDetails
    Left = 280
    Top = 224
  end
  object cmdTemp: TADOCommand
    Connection = DataModule2.MainConnection
    Parameters = <>
    Left = 360
    Top = 160
  end
end
