#SingleInstance force

/**
  THIS FILE IS EXECUTED WHEN "Save ZScript..." APPEARS WHEN USERS STOP RCORDING OF ZSCRIPT MACRO
  
  
  FIRED WITH DisplayFusion App https://www.displayfusion.com/
  	
  */

; Desired file path
file_path := "c:\Program Files\Pixologic\ZBrush 2022\ZScripts\RECORDED-SCRIPT.txt"

save_as_dialog := "Save ZScript... ahk_exe ZBrush.exe"


; Extract parent folder
SplitPath, file_path,, parent_folder

; Test if folder exists
IfExist, %parent_folder%
{
	
	; Wait for Save As dialog (common Windows dialog)
	WinWaitActive, Save ZScript... ahk_exe ZBrush.exe,, 5
	
	
	if ErrorLevel
	{
		MsgBox, Save As dialog not found.
		ExitApp
	}
	
	; Set text into filename Edit control (ClassNN: Edit1)
	ControlSetText, Edit1, %file_path%, %save_as_dialog%
	
	; Small delay to ensure text is applied
	Sleep, 500
	
	; Press Save button (usually Button1)
	ControlSend, Button1, {Enter}, %save_as_dialog%
	
	Sleep, 500
	
	; Press Yes
	ControlSend,, y{Enter}, Confirm Save As
  
}
else
{
    MsgBox, 48, Folder Missing, Parent folder does not exist:`n%parent_folder%`n`nSET CORRECT PATH IN FILE:`n`n%A_LineFile%
	
	Run, notepad++.exe "%A_ScriptFullPath%"

    ExitApp
}

