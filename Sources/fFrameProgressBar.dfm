object FrameProgressBar: TFrameProgressBar
  Left = 0
  Top = 0
  Width = 316
  Height = 33
  AutoSize = True
  DoubleBuffered = True
  ParentDoubleBuffered = False
  TabOrder = 0
  Visible = False
  object Shape: TShape
    Left = 0
    Top = 0
    Width = 316
    Height = 33
    Brush.Color = clBtnFace
    Pen.Mode = pmMask
    Pen.Style = psDash
    Pen.Width = 2
  end
  object ProgressBar: TProgressBar
    Left = 8
    Top = 8
    Width = 300
    Height = 17
    ParentCustomHint = False
    DoubleBuffered = True
    Max = 10
    ParentDoubleBuffered = False
    Position = 5
    Smooth = True
    TabOrder = 0
  end
end
