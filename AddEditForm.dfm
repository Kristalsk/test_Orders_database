object fAddEditModal: TfAddEditModal
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1079#1072#1082#1072#1079#1095#1080#1082#1072
  ClientHeight = 210
  ClientWidth = 163
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object gridAddEditOrders: TDBGrid
    Left = 0
    Top = 0
    Width = 163
    Height = 185
    Align = alClient
    DataSource = dsAddEditOrders
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
    OnDblClick = gridAddEditOrdersDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #1047#1072#1082#1072#1079#1095#1080#1082
        Title.Color = clGradientActiveCaption
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOD'
        Visible = False
      end>
  end
  object BitBtn1: TBitBtn
    Left = 0
    Top = 185
    Width = 163
    Height = 25
    Align = alBottom
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
  end
  object gridAddEditGoods: TDBGrid
    Left = 0
    Top = 0
    Width = 163
    Height = 185
    Align = alClient
    DataSource = dsAddEditGoods
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
    OnDblClick = gridAddEditGoodsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1058#1086#1074#1072#1088
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object qryAddEditOrder: TADOQuery
    Connection = DataModule2.MainConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 256
    Top = 208
  end
  object dsAddEditOrders: TDataSource
    DataSet = qryAddEditOrder
    Left = 256
    Top = 128
  end
  object qryAddEditGoods: TADOQuery
    Connection = DataModule2.MainConnection
    CursorType = ctStatic
    Parameters = <>
    Left = 216
    Top = 128
  end
  object dsAddEditGoods: TDataSource
    DataSet = qryAddEditGoods
    Left = 224
    Top = 80
  end
end
