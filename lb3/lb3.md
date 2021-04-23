# LB3 - Wordpress mit Reverse Proxy Webentwicklung Umgebung

## Inhaltsverzeichnis
- [LB3 - Wordpress mit Reverse Proxy Webentwicklung Umgebung](#lb3---wordpress-mit-reverse-proxy-webentwicklung-umgebung)
  - [Inhaltsverzeichnis](#inhaltsverzeichnis)
  - [1. Einführung](#1-einführung)
  - [2. Installation](#2-installation)
  - [8. Quellenangabe](#8-quellenangabe)

## 1. Einführung
Dieses Projekt wurde für die LB3 M300 entwickelt, mit dem Ziel ein produktives Wordpress Webentwicklung Umgebung mit Reverse Proxy umzusetzen auf Basis von "Infrastructure as Code". 
Die produktive Webentwicklung Umgebung besitzt eine MySQL Datenbank und ein Wordpress Container.

Wir verwenden hierfür die Tools Docker. 


## 2. Installation

### 2.1 Voraussetzungen

- Windows 7+ / Windows server 2003+
- Powershell v2+
- .NET Framework 4+


Installation neuste Version von Tool Docker


Für die Automatische Installation, öffnen Sie `cmd.exe` als Administrator und fügen Sie den folgenden Befehl ein.
```bash
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin" && choco install -y vagrant & choco install -y virtualbox
```



### 2.2 Respository Klonen
```bash
git clone https://github.com/FailForImprove/m300_lb/lb3
```

Um die Boxen zu bauen, verwenden Sie `vagrant up`.


## 8. Quellenangabe

- https://hub.docker.com/_/wordpress
- https://docs.docker.com/engine/
- https://www.ionos.de/digitalguide/server/knowhow/wordpress-in-docker-containern/