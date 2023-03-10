#SingleInstance force

/** -------------------------------------------
  *
  *    CREATE SCRIPTS FOLDER HARDLINK TO C:\
  *
  * -------------------------------------------
  */

Class HardLinkCreator
{
	/** CREATE HARDLINKS TOS ZBRUSH
	 */
	createHardlink( $path_source, $path_link )
	{
		$path_source	:= this._sanitizeBackslashes( $path_source )
		$path_link	:= this._sanitizeBackslashes( $path_link )

		$is_folder := InStr( FileExist($path_source), "D" ) != 0
		
		$file_or_folder	:= $is_folder ? "/d" : ""
		
		if( FileExist($path_source) )
		{		
			this._deleteOldLink( $path_link, $is_folder )
			
			$mklink	:= "mklink " $file_or_folder " """ $path_link """ """ $path_source """"
			;MsgBox,262144,mklink, %$mklink%
			RunWait %comspec% /c %$mklink%,,Hide
		}
	}
	
	/**
	 */
	_deleteOldLink( $path_link, $is_folder )
	{
		if( $is_folder  )
			FileRemoveDir, %$path_link%
		
		else
			FileDelete, %$path_link%	
	}
	
	/**
	 */
	_sanitizeBackslashes( $path )
	{
		return % RegExReplace( $path, "[/\\]+", "\") ;"
	}
}

$HardLinkCreator := new HardLinkCreator()

;$HardLinkCreator.createHardlink( $path_source, $path_link )


$path_source:= A_WorkingDir "/"

MsgBox,262144,path_source, %$path_source%,3
