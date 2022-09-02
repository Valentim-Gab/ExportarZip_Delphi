object Form1: TForm1
  Left = 1961
  Top = 232
  Width = 426
  Height = 242
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
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 393
    Height = 145
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Button1: TButton
    Left = 328
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Exportar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 248
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Importar'
    TabOrder = 3
    OnClick = Button3Click
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
    Left = 184
    Top = 160
  end
  object OpenDialog1: TOpenDialog
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 120
    Top = 160
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.zip'
    FileName = 'C:\Users\gabriel.arruda\Desktop\teste2.zip'
    Filter = 'Pasta compactada|*.zip'
    Options = [ofHideReadOnly, ofExtensionDifferent, ofEnableSizing]
    Left = 152
    Top = 160
  end
  object OpenDialog2: TOpenDialog
    DefaultExt = '*.zip'
    Filter = 'Pasta compactada|*.zip'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 216
    Top = 160
  end
end
