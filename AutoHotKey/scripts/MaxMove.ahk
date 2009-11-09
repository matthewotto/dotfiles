;MaxMove.ahk
; Press a hotkey repeatedly to move a window to the next monitor
;Skrommel @ 2008

#SingleInstance,Force
#NoEnv
SetWinDelay,0

movekey=F1
Hotkey,%movekey%,MOVE
Return


MOVE:
  active:=WinExist("A")
  SysGet,monitors,MonitorCount
  Loop,% monitors
    SysGet,monitor%A_Index%,Monitor,%A_index% 

  WinGet,minmax,MinMax,ahk_id %active%
  If minmax=1
    WinRestore,ahk_id %active%
  WinGetPos,resx,resy,resw,resh,ahk_id %active%
  Loop,% monitors
  {
    current:=A_Index
    If (resx+resw/2<monitor%current%Left Or resx+resw/2>monitor%current%Right)
      Continue
    If (resy+resh/2<monitor%current%Top Or resy+resh/2>monitor%current%Bottom)
      Continue
    next:=current+1
    If (next>monitors)
      next:=1
    WinGet,style,Style,ahk_id %active%
    If (style & 0x40000)  ; WS_SIZEBOX=0x40000
      WinMove,ahk_id %active%,,% monitor%next%Left+(resx-monitor%current%Left)/(monitor%current%Right-monitor%current%Left)*(monitor%next%Right-monitor%next%Left),% monitor%next%Top+(resy-monitor%current%Top)/(monitor%current%Bottom-monitor%current%Top)*(monitor%next%Bottom-monitor%next%Top),% resw/(monitor%current%Right-monitor%current%Left)*(monitor%next%Right-monitor%next%Left),% resh/(monitor%current%Bottom-monitor%current%Top)*(monitor%next%Bottom-monitor%next%Top)
    Else      
      WinMove,ahk_id %active%,,% monitor%next%Left+(resx-monitor%current%Left)/(monitor%current%Right-monitor%current%Left)*(monitor%next%Right-monitor%next%Left),% monitor%next%Top+(resy-monitor%current%Top)/(monitor%current%Bottom-monitor%current%Top)*(monitor%next%Bottom-monitor%next%Top)
    If minmax=1
      WinMaximize,ahk_id %active%
    Break
  }
Return