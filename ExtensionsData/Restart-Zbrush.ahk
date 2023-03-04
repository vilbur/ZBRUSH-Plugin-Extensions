#SingleInstance force
#NoTrayIcon


/** Realative path from ".....\ZBrush\ZStartup\ZPlugs64\"
  *	
  */
$zbrush_path := A_WorkingDir "\Zbrush.exe"


if( FileExist($zbrush_path) )
{
	WinWaitClose, ahk_exe Zbrush.exe,, 30
	
	if ! ErrorLevel
		Run, %$zbrush_path%		
}
else
	MsgBox,262144, ZBRUSH PATH ERROR, % "Zbrush.exe not found in`n`n" $zbrush_path
	
ExitApp