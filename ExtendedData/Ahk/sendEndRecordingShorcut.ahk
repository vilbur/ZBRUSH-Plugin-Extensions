#SingleInstance force

if( $zbrush_window	:= WinExist( "ahk_exe ZBrush.exe" ) )
{
	WinActivate, ahk_exe ZBrush.exe

	/*
		Execute command "~VIL-PLUGINS:MaxZbrushSync:Max to Zbrush" in "../../Zbrush/MaxZbrushSync.txt"
	*/
	;Send, {Ctrl Down}{Shift Down}{F8}{Ctrl Up}{Shift Up}
	Send, "{Ctrl Down}{Shift Down}{Ctrl Down}{Alt Down}E{Ctrl Up}{Shift Up}{Ctrl Down}{Alt Up}"
}