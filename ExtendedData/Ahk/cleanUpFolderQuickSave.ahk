#SingleInstance force

#Include %A_LineFile%\..\cleanUpFolder.ahk	;;; ./cleanUpFolder.ahk'

; --- get full path of current ahk file
script_path := A_WorkingDir
;msgBox %script_path%

; --- extract ZBrush version (4-digit year)
RegExMatch(script_path, "ZBrush\s+(\d{4})", match)
zbrush_version := match1

;msgBox %zbrush_version%
; --- original target path
quicksave_path := "c:\Users\Public\Documents\ZBrushData2022\QuickSave"

; --- replace version in target path
quicksave_path := RegExReplace(quicksave_path, "ZBrushData\d{4}", "ZBrushData" zbrush_version)

; --- test output
;MsgBox, Script Path:`n%script_path%`n`nExtracted Version:`n%zbrush_version%`n`nNew Path:`n%quicksave_path%


extension_to_delete   := "zpr"
quota_size := 10000 ;; in MB


CheckAndPurgeFiles(quicksave_path, extension_to_delete, quota_size, true)


