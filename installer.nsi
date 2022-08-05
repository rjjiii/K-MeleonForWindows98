;K-Meleon 1.5 for Windows 98
;Installer by R. Jones © 2/22/2022
;Avaialable under the GPL v2.0, v3.0 or later
;Full license in license.txt or online below:
;https://www.gnu.org/licenses/licenses.en.html

;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"

;--------------------------------
;General

  ;Name and file
	Name "K-Meleon 1.5 for Windows 9X"
	OutFile "KMforWin9x_Installer.exe"
	Unicode False
	RequestExecutionLevel user

  ;Default installation folder
	InstallDir $PROGRAMFILES\KMforWin9X

	SetCompressor /SOLID lzma
	SetCompressorDictSize 64
	SetDatablockOptimize ON
;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING

;--------------------------------
;Pages

  !insertmacro MUI_PAGE_LICENSE License.txt
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  
;--------------------------------
;Languages
 
  !insertmacro MUI_LANGUAGE "English"

;--------------------------------
;Installer Sections

Section "K-Meleon" SecCore

  SetOutPath "$INSTDIR"
  
  ; Put file there
  CreateShortCut "$INSTDIR\K-Meleon9X.lnk" "$INSTDIR\K-Meleon1.5.4en-US\k-meleonW9x.exe"
  File /r K-Meleon1.5.4en-US  
  File /r License.txt

SectionEnd

Section "Desktop Shortcut" SecDesktop
    SetShellVarContext current
    CreateShortCut "$DESKTOP\K-Meleon9X.lnk" "$INSTDIR\K-Meleon1.5.4en-US\k-meleonW9x.exe"
SectionEnd

Section "Quick Launch" SecQuick
    SetShellVarContext current
    CreateShortCut "$QUICKLAUNCH\K-Meleon9X.lnk" "$INSTDIR\K-Meleon1.5.4en-US\k-meleonW9x.exe"
SectionEnd



;--------------------------------
;Descriptions

  ;Language strings
  LangString DESC_SecCore ${LANG_ENGLISH} "The K-Meleon web browser for Windows 98 and Me."
  LangString DESC_SecDesktop ${LANG_ENGLISH} "Create a desktop shortcut."
  LangString DESC_SecQuick ${LANG_ENGLISH} "Add to Quick Launch in the Taskbar."


  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecCore} $(DESC_SecCore)
    !insertmacro MUI_DESCRIPTION_TEXT ${SecDesktop} $(DESC_SecDesktop)
    !insertmacro MUI_DESCRIPTION_TEXT ${SecQuick} $(DESC_SecQuick)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END
