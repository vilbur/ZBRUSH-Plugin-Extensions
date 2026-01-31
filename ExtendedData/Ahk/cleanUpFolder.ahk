; ============================================================
; Function: CheckAndPurgeFiles
; Scans a directory for files of given extension, sums size,
; compares against quota, and optionally deletes files.
;
; Parameters:
;   dir_path        - folder to scan
;   file_ext        - file extension (without dot, e.g. "tmp")
;   quota_bytes     - max allowed size in bytes
;   recursive       - true/false
; ============================================================
CheckAndPurgeFiles(dir_path, file_ext, quota_size, recursive := true)
{
    total_size := 0
    file_list := []
	
	quota_bytes := quota_size * 1024 * 1024  

    loop_mode := recursive ? "R" : ""

    Loop, Files, % dir_path "\*." file_ext, % loop_mode
    {
        total_size += A_LoopFileSize
        file_list.Push(A_LoopFileFullPath)
    }

    if (file_list.Length() = 0)
    {
        MsgBox, 64, Info, No *.%file_ext% files found in:`n%dir_path%
        return
    }

    if (total_size > quota_bytes)
    {

		/* COMFIRM
		*/ 
        MsgBox, 4, , % "FOLDER:`n" dir_path "`n`n IS FULL OF: *" file_ext " FILES`n`nTotal size:" FormatBytes(total_size) "`nQuota: " FormatBytes(quota_bytes)  "`n`nDELETE ALL " %file_ext% " FILES IN FOLDER ?"
		
		IfMsgBox, No
			return 
    }

	/* DELETE FILES
	*/ 
    for index, file_path in file_list
        FileDelete, %file_path%
        ;MsgBox, %file_path%

;    MsgBox, 64, Done, Deleted % file_list.Length() " files."
}

; ============================================================
; Helper: FormatBytes
; Converts bytes to human-readable string
; ============================================================
FormatBytes(bytes)
{
    units := ["B", "KB", "MB", "GB", "TB"]
    i := 1

    while (bytes >= 1024 && i < units.Length())
    {
        bytes /= 1024
        i++
    }

    return Round(bytes, 2) " " units[i]
}

; ============================================================
; TEST CODE
;test_dir   := "c:\Users\Public\Documents\ZBrushData2022\QuickSave"
;test_ext   := "zpr"
;quota_size := 10000
;
;CheckAndPurgeFiles(test_dir, test_ext, quota_size, true)
; ============================================================


