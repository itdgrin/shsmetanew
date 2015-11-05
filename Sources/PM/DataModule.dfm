object DM: TDM
  OldCreateOrder = False
  Height = 208
  Width = 132
  object Connect: TFDConnection
    Params.Strings = (
      'User_name=root'
      'Password=serg'
      'SERVER=localhost'
      'DATABASE=pm'
      'CharacterSet=cp1251'
      'TinyIntFormat=Integer'
      'DriverID=MySQL')
    FormatOptions.AssignedValues = [fvSortOptions, fvStrsTrim2Len]
    Connected = True
    LoginPrompt = False
    Transaction = Read
    UpdateTransaction = Read
    Left = 48
    Top = 8
  end
  object Read: TFDTransaction
    Connection = Connect
    Left = 32
    Top = 56
  end
  object Write: TFDTransaction
    Connection = Connect
    Left = 72
    Top = 56
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'libmysql.dll'
    Left = 48
    Top = 104
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrDefault
    Left = 48
    Top = 152
  end
end
