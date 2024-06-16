# Credit: Large portions of code below is based on osab's Installer. Thank you for making an awesome tool!

!macro downloadPack packName packLink outputFile packSHA256
${Do}
	IfFileExists "${outputFile}" +5 0
	DetailPrint "Downloading ${packName} from ${packLink}. Closing the download window will interrupt the download."
	NScurl::http GET "${packLink}" "${outputFile}" /RESUME /INSIST /END
	Pop $0 # return value = exit code, "OK" means OK
	DetailPrint "${packName} download status: $0" 
	NScurl::sha256 "${outputFile}"
	Pop $R1
	${if} $R1 == "${packSHA256}"
		DetailPrint "Package ${packName} from ${outputFile} downloaded and verified successfully."
		${Break}
	${else}
		${If} ${Cmd} `MessageBox MB_RETRYCANCEL|MB_ICONEXCLAMATION "${outputFile} seems to be corrupted. This may be due to a bad connection or interrupted download. Would you like to retry?" /SD IDRETRY IDRETRY`
			Delete "${outputFile}"
		${Else}
			DetailPrint "Download Aborted. Please reopen the Helper and try again."
			Abort
		${Endif}
	${endif}
${Loop}
!macroend

!macro extractPack packName inputFile
${Do}
	DetailPrint "Extracting ${packName} from ${inputFile}."
	Nsis7z::ExtractWithDetails "${inputFile}" "Extracting ${packName} %s..."
!macroend

