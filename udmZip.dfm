object Form1: TForm1
  Left = 1840
  Top = 143
  Width = 424
  Height = 284
  Caption = 'Gerenciador de arquivos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 8
    Width = 329
    Height = 41
    Caption = 'Adicione ou importe'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 8
    Top = 56
    Width = 393
    Height = 153
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Button1: TButton
    Left = 88
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Compactar'
    Enabled = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 240
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Importar'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 320
    Top = 216
    Width = 83
    Height = 25
    Caption = 'Descompactar'
    Enabled = False
    TabOrder = 4
    OnClick = Button4Click
  end
  object KAZip1: TKAZip
    IsZipFile = False
    SaveMethod = FastSave
    StoreRelativePath = True
    StoreFolders = True
    CompressionType = ctMaximum
    UseTempFiles = False
    OverwriteAction = oaSkip
    ComponentVersion = '2.0'
    ReadOnly = False
    ApplyAtributes = True
    Active = False
    Left = 192
    Top = 168
  end
  object OpenDialog1: TOpenDialog
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 32
    Top = 176
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.zip'
    Filter = 'Pasta compactada|*.zip'
    Options = [ofHideReadOnly, ofExtensionDifferent, ofEnableSizing]
    Left = 112
    Top = 176
  end
  object OpenDialog2: TOpenDialog
    DefaultExt = '*.zip'
    Filter = 'Pasta compactada|*.zip'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 264
    Top = 176
  end
  object SaveDialog2: TSaveDialog
    Filter = 'Pasta| '
    Left = 344
    Top = 176
  end
end
