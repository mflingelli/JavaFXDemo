# JavaFX Demo
![Build-Status](https://github.com/mflingelli/JavaFXDemo/actions/workflows/maven.yml/badge.svg)

Damit diese Anwendung ausgeführt werden kann, muss die OpenJX-Bibliothek zur Verfügung stehen.
Diese kann auf folgender Webseite heruntergeladen werden: [https://gluonhq.com/products/javafx/](https://gluonhq.com/products/javafx/)

## IntelliJ

Die Integration von JavaFX und IntelliJ ist hier zu finden: [https://openjfx.io/openjfx-docs/](https://openjfx.io/openjfx-docs/)

Der Pfad zur OpenFX-Installation mus in den Run/Debug-Konfigurationen unter den VM-Optionen angegeben werden:

Unter **Modify Options** muss der Eintrag **Add VM options** ausgewählt werden:

![](doc/Run-Configuration-VM-Options.png)

![](doc/Run-Configuration.png)

Die vollständige Angabe lautet beispielsweise:

```
--module-path "C:\Software\javafx-sdk-21.0.4\lib" --add-modules javafx.controls
```

Die OpenFX-Installation befindet sich im Ordner `C:\Software\javafx-sdk-21.0.4\lib`. Da
auch das Modul `javafx.controls` verwendet werden soll, ist dieses anzugeben.

## Projektstruktur

In der Projektstruktur (File -> Project Structure...) müssen noch die JavaFX-Bibliotheken eingebunden werden (Ordner `lib`).

![Projektstruktur der Bibliotheken](doc/Project-Structure-Libraries.png)

## JavaFX controls

Das GitHub-Projekt controlsfx stellt zusätzliche UI-Elemente zur Verfügung.
Mehr Informationen dazu können auf deren Webseite abgerufen werden:

* Homepage: [https://controlsfx.github.io/](https://controlsfx.github.io/)
* GitHub: [https://github.com/controlsfx/controlsfx](https://github.com/controlsfx/controlsfx)

## NSIS-Installer

Damit das Bauen des Installers funktioniert, muss auf dem System [NSIS](https://nsis.sourceforge.io/Download) 
(Nullsoft Scriptable Install System) installiert sein.

Der Pfad zur Datei `makensis.exe` ist aktuell hartcodiert hinterlegt.

Das Bauen des Installers ist im Profil `Installer` hinterlegt.

Der folgende Screenshot zeigt die erste Seite des Installers:

![NSIS-Installer](doc/NSIS-Installer.png)