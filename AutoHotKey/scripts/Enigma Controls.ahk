!F2:: WinMinimize, A
!F3::
WinGet MX, MinMax, A
If MX
WinRestore A
Else WinMaximize A
return