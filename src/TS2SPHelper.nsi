Unicode true 
Target amd64-unicode
;Target x86-unicode

# Installer Includes
!define MUI_WELCOMEFINISHPAGE_BITMAP "..\img\SidebarImage.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "..\img\SidebarImage.bmp"

!include "ModernXL.nsh"
!include "MUI2.nsh"
!include "x64.nsh"
!include "WinVer.nsh"
!include "LogicLib.nsh"
!include ".\DownloaderInstaller.nsh"

!include "FileFunc.nsh"

# Installer Parameters

Name "RetroSimsMods - Sims 2 Starter Pack Helper"
OutFile "..\bin\TS2SPackHelper.x64.exe"

RequestExecutionLevel admin

InstallDir "$PROGRAMFILES32\The Sims 2 Starter Pack"

ManifestDPIAware True

VIProductVersion 1.0.0.0
VIAddVersionKey "CompanyName" "RetroSimsMods"
VIAddVersionKey "FileVersion" "1.0.0"
VIAddVersionKey "ProductName" "Local Downloader for The Sims 2 Starter Pack"
VIAddVersionKey "ProductVersion" "1.0"

# MUI UI/UX Design
brandingText "RetroSimsMods Helper v1.0"

!define MUI_INSTFILESPAGE_COLORS "F2F2F2 1E1E1E"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_RIGHT
!define MUI_HEADERIMAGE_BITMAP "..\img\HeaderImage.bmp"
; !define MUI_HEADERIMAGE_BITMAP_STRETCH AspectFitHeight
!define MUI_ICON "..\img\ExeIcon.ico"

!define MUI_PAGE_HEADER_TEXT "RetroSimsMods Sims 2 Starter Pack Helper"
!define MUI_PAGE_HEADER_SUBTEXT "Starter Pack Helper for osab's Offline Installer"
!define MUI_WELCOMEPAGE_TITLE "Sims 2 Starter Pack Helper"
!define MUI_WELCOMEPAGE_TEXT "Welcome to the Sims 2 Starter Pack Helper for osab's Offline Installer. This Helper will automatically download the required files for the Offline Installer for local storage and installation. An internet connection is only required for the initial download. $\n$\n After downloading, this Helper can automatically extract and copy files to the default Sims 2 Starter Pack installation folder. Use that option before installing using the Offline Installer. $\n$\nCredit: Large portions of code in this Helper are based on osab's Installer. Thank you for making an awesome tool!"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

# Show installation details
ShowInstDetails show

# Variables
Var AL
Var BoB
Var BV
Var Base
Var DD
Var FT
Var FwP
Var GLS
Var SS
Var UNI

# Begin Installation
# Links to Packs

Section "Download/Verify The Sims 2 Starter Pack Files" TS2SPDownload
	AddSize 4800000
	SectionIn RO
	Call TS2SPDownload
SectionEnd

Section /o "Install The Sims 2 Starter Pack Files" TS2SPInstall
	AddSize 9900000
	Call TS2SPInstall
SectionEnd

; Section Descriptions
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
	!insertmacro MUI_DESCRIPTION_TEXT ${TS2SPDownload} "Downloads The Sims 2 Starter Pack files locally to your computer if needed, and verifies their integrity. Internet connection only required for initial download."
	!insertmacro MUI_DESCRIPTION_TEXT ${TS2SPInstall} "Extracts and copies downloaded Sims 2 Starter Pack files from the local directory to the default install folder. Use this before installing the Ultimate Collection using the Offline Installer."
!insertmacro MUI_FUNCTION_DESCRIPTION_END

Function TS2SPDownload 
	DetailPrint "Starting task 'Download/Verify The Sims 2 Starter Pack Files'..."


	StrCpy $AL "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13.2/ApartmentLife.7z"
	StrCpy $BoB "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13.2/BestofBusiness.7z"
	StrCpy $BV "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13.2/BonVoyage.7z"
	StrCpy $Base "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13.2/Base.7z"
	StrCpy $DD "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13.2/DoubleDeluxe.7z"
	StrCpy $FT "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13.2/FreeTime.7z"
	StrCpy $FwP "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13.2/FunwithPets.7z"
	StrCpy $GLS "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13.2/GlamourLifeStuff.7z"
	StrCpy $SS "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13.2/Seasons.7z"
	StrCpy $UNI "https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v13.2/UniversityLife.7z"

	# Downloading Game
	SetOutPath "$EXEDIR\TS2StarterPackFiles\"
	!insertmacro downloadPack "Apartment Life" "$AL" ".\ApartmentLife.7z" "f02b62646e28448eb39e291bca46f9aa35202f92bcb047b6cfa8534299eeec0e"
	!insertmacro downloadPack "Best of Business" "$BoB" ".\BestofBusiness.7z" "d40c4b64b2389443ffb6007119d8fcb3f9158fc7794ba9cc94f08581e521c67e"
	!insertmacro downloadPack "Bon Voyage" "$BV" ".\BonVoyage.7z" "56bfa2c105a431a871aa4cda42e0925ccf7d8bb989e4ed2cb974183bcf4453de"
	!insertmacro downloadPack "Base Game" "$Base" ".\Base.7z" "6f3ae7156dec22301b52b14ebaa5f9e5e3ba87ddcfa0335988d0958416514b62"
	!insertmacro downloadPack "Double Deluxe Packs" "$DD" ".\DoubleDeluxe.7z" "10cecf8869702987ccb536dfa3c78fd59d9d11666d43e78d029f27535a58f5b2"
	!insertmacro downloadPack "FreeTime" "$FT" ".\FreeTime.7z" "2f92f91f5c97656c8c5dabb46d33dbf0101055ac0b2b7b5c1154b5cd7128459e"
	!insertmacro downloadPack "Fun with Pets" "$FwP" ".\FunwithPets.7z" "1aa6f71720e12bafbea7bc789cea60f1d95ea67eff4c4b8c05fee57a3ba45595"
	!insertmacro downloadPack "Glamour Life Stuff" "$GLS" ".\GlamourLifeStuff.7z" "e9642ac8ef1400683f7c54bdb04c10407a3d21a87228a25363dab76bd1144364"
	!insertmacro downloadPack "Seasons" "$SS" ".\Seasons.7z" "a95957f69b2d89dd681b7e49f3b05f3155a4071e9ed4ec3690486cc89d469866"
	!insertmacro downloadPack "University Life" "$UNI" ".\UniversityLife.7z" "3a6926bb2005696008f4f8703fee6d3a99099d4eff40dc26a51a21dd4fb86351"
	
	DetailPrint ""
	DetailPrint "All game files downloaded and verified successfully. You can store the game files on a "
	DetailPrint "personal storage device if you wish to do so, by keeping the TS2StarterPackFiles folder"
	DetailPrint "in the install directory."
	DetailPrint ""
	Sleep 5000
FunctionEnd

Function TS2SPInstall
	DetailPrint "Starting task 'Install The Sims 2 Starter Pack Files'..."
	SetOutPath "$PROGRAMFILES32\The Sims 2 Starter Pack"
	!insertmacro extractPack "Apartment Life" "$EXEDIR\TS2StarterPackFiles\ApartmentLife.7z"
	!insertmacro extractPack "Best of Business" "$EXEDIR\TS2StarterPackFiles\BestofBusiness.7z" 
	!insertmacro extractPack "Bon Voyage" "$EXEDIR\TS2StarterPackFiles\BonVoyage.7z" 
	!insertmacro extractPack "Base Game" "$EXEDIR\TS2StarterPackFiles\Base.7z" 
	!insertmacro extractPack "Double Deluxe Packs" "$EXEDIR\TS2StarterPackFiles\DoubleDeluxe.7z" 
	!insertmacro extractPack "FreeTime" "$EXEDIR\TS2StarterPackFiles\FreeTime.7z" 
	!insertmacro extractPack "Fun with Pets" "$EXEDIR\TS2StarterPackFiles\FunwithPets.7z" 
	!insertmacro extractPack "Glamour Life Stuff" "$EXEDIR\TS2StarterPackFiles\GlamourLifeStuff.7z" 
	!insertmacro extractPack "Seasons" "$EXEDIR\TS2StarterPackFiles\Seasons.7z" 
	!insertmacro extractPack "University Life" "$EXEDIR\TS2StarterPackFiles\UniversityLife.7z" 
FunctionEnd