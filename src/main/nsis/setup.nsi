# Unicode aktivieren für moderne Windows-Systeme
Unicode true

# Modern UI 2 einbinden
!include "MUI2.nsh"

# Name und Ausgabe des Installers
Name "JavaFXDemo"
OutFile "${PROJECT_DIR}\target\JavaFXDemo-Setup.exe"
InstallDir "$PROGRAMFILES64\JavaFXDemo"

# Standard-Installationsverzeichnis in der Registry merken
InstallDirRegKey HKCU "Software\JavaFXDemo" ""

# --- SEITEN-KONFIGURATION ---

# 1. Lizenzseite (MIT)
!define MUI_LICENSEPAGE_CHECKBOX # Optional: Erzwingt eine Checkbox zum Akzeptieren
!insertmacro MUI_PAGE_LICENSE "${PROJECT_DIR}\src\main\nsis\LICENSE.txt"

# 2. Verzeichnisauswahl
!insertmacro MUI_PAGE_DIRECTORY

# 3. Installationsfortschritt
!insertmacro MUI_PAGE_INSTFILES

# 4. Fertigstellungsseite mit einer eigenen Start-Funktion
!define MUI_FINISHPAGE_RUN
!define MUI_FINISHPAGE_RUN_FUNCTION "StartApplication"
!define MUI_FINISHPAGE_RUN_NOTCHECKED # Checkbox ist standardmäßig abgewählt
!insertmacro MUI_PAGE_FINISH

# Deinstaller-Seiten
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

# Sprache festlegen
!insertmacro MUI_LANGUAGE "German"

# --- EIGENE FUNKTIONEN ---

# Diese Funktion wird aufgerufen, wenn der Haken am Ende gesetzt bleibt
Function StartApplication
    # ExecShell fängt alle Parameter sauber in einem einzigen String ab
    ExecShell "open" "javaw.exe" '-jar "$INSTDIR\JavaFXDemo.jar"'
FunctionEnd

# --- INSTALLATIONS-SCHRITTE ---

Section "MainSection" SEC01
    SetOutPath "$INSTDIR"

    # Hauptanwendung kopieren
    File "${PROJECT_DIR}\target\JavaFXDemo.jar"

    # Abhängigkeiten kopieren
    SetOutPath "$INSTDIR\lib"
    File /r "${PROJECT_DIR}\target\lib\*.*"

    # Ausgabepfad zurücksetzen und Verknüpfungen erstellen
    SetOutPath "$INSTDIR"
    CreateShortCut "$DESKTOP\JavaFXDemo.lnk" "javaw.exe" '-jar "$INSTDIR\JavaFXDemo.jar"'
    CreateDirectory "$SMPROGRAMS\JavaFXDemo"
    CreateShortCut "$SMPROGRAMS\JavaFXDemo\JavaFXDemo.lnk" "javaw.exe" '-jar "$INSTDIR\JavaFXDemo.jar"'
    CreateShortCut "$SMPROGRAMS\JavaFXDemo\Deinstallieren.lnk" "$INSTDIR\uninstall.exe"

    # Registry-Einträge für Deinstallation schreiben
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\JavaFXDemo" "DisplayName" "JavaFXDemo"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\JavaFXDemo" "UninstallString" "$INSTDIR\uninstall.exe"

    # Deinstaller schreiben
    WriteUninstaller "$INSTDIR\uninstall.exe"
SectionEnd

Section "Uninstall"
    # Dateien löschen
    Delete "$INSTDIR\JavaFXDemo.jar"
    RMDir /r "$INSTDIR\lib"
    Delete "$INSTDIR\uninstall.exe"
    RMDir "$INSTDIR"

    # Verknüpfungen löschen
    Delete "$DESKTOP\JavaFXDemo.lnk"
    RMDir /r "$SMPROGRAMS\JavaFXDemo"

    # Registry löschen
    DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\JavaFXDemo"
SectionEnd
