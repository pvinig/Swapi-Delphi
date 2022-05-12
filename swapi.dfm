object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 699
  ClientWidth = 827
  Color = clBtnFace
  DockSite = True
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object SWAPI: TLabel
    Left = 176
    Top = 83
    Width = 36
    Height = 15
    Caption = 'SWAPI'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Britannic Bold'
    Font.Style = []
    ParentFont = False
  end
  object Buscar: TButton
    Left = 152
    Top = 131
    Width = 89
    Height = 30
    Caption = 'Buscar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Britannic Bold'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = BuscarClick
  end
  object Edit1: TEdit
    Left = 120
    Top = 104
    Width = 153
    Height = 21
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnChange = RichEdit1Change
  end
  object RichEdit1: TRichEdit
    Left = 376
    Top = 8
    Width = 451
    Height = 683
    Cursor = crHandPoint
    Color = clWindowText
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -16
    Font.Name = 'Britannic Bold'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
    Zoom = 100
    OnChange = RichEdit1Change
    OnClick = RichEdit1Change
  end
  object RESTClient1: TRESTClient
    BaseURL = 'https://swapi.dev/api'
    ContentType = 'application/json'
    Params = <>
    ReadTimeout = 60000
    Left = 112
    Top = 536
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    Left = 112
    Top = 584
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 112
    Top = 632
  end
  object RESTClient2: TRESTClient
    BaseURL = 'https://swapi.dev/api'
    ContentType = 'application/json'
    Params = <>
    ReadTimeout = 60000
    Left = 200
    Top = 536
  end
  object RESTRequest2: TRESTRequest
    AssignedValues = [rvReadTimeout]
    Client = RESTClient2
    Params = <>
    Response = RESTResponse2
    ReadTimeout = 600000
    Left = 200
    Top = 584
  end
  object RESTResponse2: TRESTResponse
    ContentType = 'application/json'
    Left = 200
    Top = 632
  end
end
