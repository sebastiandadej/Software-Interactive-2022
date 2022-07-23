/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

#include <QtGui/QGuiApplication>
#include <QtQml/qqml.h>
#include <QtQml/QQmlEngine>
#include <QtQuick/QQuickView>
#include "glownaKlasa.h"


//Dodano z filesystembrowser
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QFileSystemModel>
#include <QDateTime>
#include <QDesktopServices>
#include <QUrl>




void initializeImageFileDialog( QFileDialog &dialog, QFileDialog::AcceptMode acceptMode )
{
    bool firstDialog = true;

    if(firstDialog)
    {
        firstDialog = false;
        QStringList picturesLocations = QStandardPaths::standardLocations(QStandardPaths::PicturesLocation);
        dialog.setDirectory(picturesLocations.isEmpty() ? QDir::currentPath() : picturesLocations.last());
    }

    QStringList mimeTypeFilters;
    const QByteArrayList supportedMimeTypes = acceptMode == QFileDialog::AcceptOpen
        ? QImageReader::supportedMimeTypes() : QImageWriter::supportedMimeTypes();
    for (const QByteArray &mimeTypeName : supportedMimeTypes)
        mimeTypeFilters.append(mimeTypeName);

    mimeTypeFilters.sort();
    dialog.setMimeTypeFilters(mimeTypeFilters);
    dialog.selectMimeTypeFilter("image/jpeg");
    dialog.setAcceptMode(acceptMode);
    if( acceptMode == QFileDialog::AcceptSave ) dialog.setDefaultSuffix("jpg");

}







int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQuickView widok; // obsłuzy nam okienko

    QObject::connect( widok.engine(), SIGNAL(quit()), qApp, SLOT(quit()));


    widok.setSource(     QStringLiteral("qrc:wygladOkna.qml") ); //jak wygladac ma okno, plik w "zasobach" tu było "///"
    widok.setResizeMode( QQuickView::SizeRootObjectToView );
    widok.show();


    qInfo() << "Komunikat: " << qApp ;  //Wyświetli na konsoli
    qInfo() << QUrl("file:wygladOkna.qml");


    /*

    Przekrztałcenia:
    1)zmiana wartości RGB (np zwiększenie R każdego pixela o wybraną wartość)
        R,G,B
    2) obrócenie obrazka
        (wybór czy o 90/180/270 stopni)
    3) przerzucenie/flip (wybór czy w pionie, czy poziomie)
    4) przesuni?cie obrazka (kontrolka o ile pixeli przesunąć, i w którą stronę)
    5) filtr szarości (brak parametrów)
    6) wyzerowanie wartości R/G/B każdego pixela (wybór którego kanału, R G lub B)
    7) inne ?


     */



    QList<int> Lista;



    return app.exec();
}


