#!/bin/bash

# Erstellen Sie eine temporäre Arbeitskopie des Paketinhalts
pkgroot=$(mktemp -d /tmp/mycopy.XXXXXX)
echo "Erstelle temporären Arbeitsordner: $pkgroot"

# Kopieren Sie die Dateien aus dem Quellordner in das Zielverzeichnis
cp -R src $pkgroot/Library/Application\ Support/MyApp

# Erstellen Sie ein leeres Payload-Verzeichnis
pkgpayload=$(mktemp -d /tmp/mypayload.XXXXXX)
echo "Erstelle Payload-Ordner: $pkgpayload"
mkdir -p $pkgpayload/Library/Application\ Support/MyApp

# Kopieren Sie den Inhalt des temporären Arbeitsordners in das Payload-Verzeichnis
cp -R $pkgroot/* $pkgpayload

# Erstellen Sie das Paket mit dem Payload-Verzeichnis als Inhalt
pkgbuild --root $pkgpayload --install-location / --identifier com.myapp.myfiles --version 1.0 myfiles.pkg

# Löschen Sie die temporären Arbeitsordner
rm -rf $pkgroot
rm -rf $pkgpayload
