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

// Dokumenatcja
// (...)  https://doc.qt.io/qt-5/qml-qtquick-dialogs-filedialog.html
// QML'owe typy, https://doc.qt.io/qt-5/qmltypes.html

// była czcionka programep pro "coś tam"


import QtQuick 2.0  //ListView
import QtQuick.Dialogs 1.2  //dla FileDailog
import QtQuick.Controls 1.5 // dla TreeViewer, wyżej niz 1.5 TreeView nie działa, wyswetla błąd
// import QtQuick.Controls 2.14 // checkBox


/*ApplicationWindow //moze byc Rectangle ;D "root item", wyamga głebszych zmian w kdozie
{
    id: oknoGlowne
    width: 640
    height: 480
    title: qsTr("File System")
    visible: true


    menuBar: MenuBar
    {
        Menu { title: qsTr("File"); MenuItem { text: qsTr("Exit"); onTriggered: Qt.quit(); } }
    }
*/




Rectangle
{
    id: oknoGlowne
    width:  1200
    height: 480
    visible: true

    property string scieszka
    property string wartosc


    FileDialog
    {
        id: okienkoWyborPliku
        title:   "Milordzie wybierz plik"
        folder:  shortcuts.desktop  //tu zaczynamy :)
        visible: false;  // pojawia sie i znika //Component.onCompleted: visible = false  // czy bedzie widoczne czy nie ?

        onAccepted:
        {
            oknoGlowne.scieszka = okienkoWyborPliku.fileUrl
            console.log( "Wybrałeś: " + page.scieszka )
        }

        onRejected: { console.log("Canceled. Anulowałeś, nic nie wybrałeś.") }
    }


    /* ZADANIE */
    Dialog  // Powitalne
    {
        //id: dialog
        visible: true
        Text
        {
            text: qsTr("Witaj w programie!")
            font.pointSize: 20
        }


        standardButtons: Dialog.Ok
        onAccepted: glownaTresc.visible = true
    }


    /* Przekrztałcenie: Obrót */
    Dialog
    {
        id: okienkoObrot
        visible: false  //

        Column {
            Text
            {
                text: qsTr("O ile obrócić obraz ?")
                font.pointSize: 13
            }

            ComboBox
            {
                editable: true  // ;D
                model: ListModel {  // [ "sdfsd", "fsdf" ]
                    id: model
                    ListElement { text: "90" }
                    ListElement { text: "180" }
                    ListElement { text: "270" }
                }
                onAccepted: {
                    if( find(editText) === -1 ) model.append( {text: editText} )

                    oknoGlowne.wartosc =  currentText; console.log("A:", currentText );
                    console.log( currentIndex );

                }

            //onActivated: { oknoGlowne.wartosc =  currentText; console.log() << "A: " << oknoGlowne.wartosc; }
            //Component.onCompleted: currentIndex = indexOfValue(backend.modifier)
            }
        }


        standardButtons: Dialog.Ok | Dialog.Cancel

        onAccepted: console.log("Kliknieto: Ok");
        onRejected: { console.log("Cancel clicked"); checkBox1.checked = false; }
    }


    /* Przekrztałcenie: Zmiana wartości RGB */
    Dialog
    {
        id: okienkoRGB
        visible: false  //

        Column {
            Text {
            text: qsTr("Jak zmienić kanały R,G i B ?")
            font.pointSize: 13
            }

            Row {
                Text { text: qsTr("R") }
                TextField {            }
            }
            Row {
                Text { text: qsTr("G") }
                TextField {            }
                }

            Row {
                Text { text: qsTr("B") }
                TextField {            }
            }
        }


        standardButtons: Dialog.Cancel | Dialog.Ok

        onAccepted: console.log("Kliknieto: Ok");
        onRejected: { console.log("Cancel clicked"); checkBox1.checked = false; }
    }

    /* Przekrztałcenie: Zmiana wartości RGB */
    Dialog
    {
        id: okienkoFlip
        visible: false  //

        Column {
            Text {
            text: qsTr("Jak przezucic obraz ?")
            font.pointSize: 13
            }

            ComboBox {
                model: [ "góra-dół", "lewo-prawo" ]
                onAccepted: {
                    oknoGlowne.wartosc =  currentText; console.log("A:", currentText );
                    console.log( currentIndex );

                }
            }
        }


        standardButtons: Dialog.Cancel | Dialog.Ok

        onAccepted: console.log("Kliknieto: Ok");
        onRejected: { console.log("Cancel clicked"); checkBox1.checked = false; }
    }


    /* Przekrztałcenie: Przesuniecie obrazu */
    Dialog
    {
        id: okienkoPrzesuniecieObrazu
        visible: false  //

        Column {
            Text {   text: qsTr("Jak przesunąć obraz ?");   font.pointSize: 13 }

            Row{
            ComboBox {
                model: [ "lewo", "prawo",  ]
                onAccepted: {
                    oknoGlowne.wartosc =  currentText; console.log("No to przesuwamy:", currentText );
                    console.log( currentIndex ); } // ?
            }
            TextField { placeholderText: "Ile pikseli?" }

            }

            Row {
                ComboBox {
                model: [ "góra", "dół"  ]
                onAccepted: {
                    oknoGlowne.wartosc =  currentText; console.log("No to przesuwamy:", currentText );
                    console.log( currentIndex );

                }
                }
                TextField {
                    placeholderText: "Ile pikseli?";
                    validator: IntValidator
                    //onAccepted: { console.log("Pupa blada") }
                    //onEditingFinished: { console.log("Pupa blada") }
                }
            }
        } // Column


        standardButtons: Dialog.Cancel | Dialog.Ok

        onAccepted: console.log("Kliknieto: Ok");
        onRejected: { console.log("Cancel clicked"); checkBox1.checked = false; }
    }

    /* Przekrztałcenie: Przesuniecie obrazu */
    Dialog
    {
        id: okienkoZerowanieKanalu
        visible: false  //

        Column {
            Text {   text: qsTr("Który kanał wyzerować ?");   font.pointSize: 13 }

            // A może Repeater ???
            Row{ Text {  text: qsTr("R") } CheckBox { } }
            Row{ Text {  text: qsTr("G") } CheckBox { } }
            Row{ Text {  text: qsTr("B") } CheckBox { } }
        }


        standardButtons: Dialog.Cancel | Dialog.Ok

        onAccepted: console.log("Kliknieto: Ok");
        onRejected: { console.log("Cancel clicked"); checkBox1.checked = false; }
    } // Koniec Dialog


    /* Zawartośc głownego okna */
    Row
    {
        id: glownaTresc
        spacing: 5    //spacing: rect.myMargin, property int rows: repeater.model.entryCount, property int singleWidth: ( (rect.width-scale.width)/rows ) -rect.myMargin
        visible: false
        anchors.top: parent.top
        anchors.leftMargin: 10
        anchors.rightMargin: 10


        Column //1
        {
            spacing: 2
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.leftMargin: 10
            anchors.rightMargin: 10


            /* Przyciski wersja 1. */
            Row {
                id: rowPrzyciski1
                //anchors.horizontalCenter: parent.horizontalCenter

                //ExclusiveGroup { id: eg }
                anchors.leftMargin: 10

                Repeater
                {
                    model: [ "Wczytaj obraz", "Szybkie ponowne wczytanie" ]  //index
                    Button
                   {
                        text: modelData  // zasysa dane z Repeater.model
                        //exclusiveGroup: eg
                        checkable: false  //checked: index === 1 //onClicked: { if( model.data() === 1 )  }
                        onClicked: {
                            if( index == 0) okienkoWyborPliku.visible = true
                            if( index == 1) console.log("Alibaba ;D")
                        }
                    }
                }

            }


            Text
            {
                text: qsTr("Ostatnio wczytywany obraz")
                font.pointSize: 13
            }


            BorderImage
            {
                id: obraz1

                width: 190; height: 200

                border.left: 5; border.top: 5
                border.right: 5; border.bottom: 5

                source: oknoGlowne.scieszka //"file:abc.png"

                //fillMode: Image.TileHorizontally
                //verticalAlignment: Image.AlignLeft

            }
        }


        /* Ta druga z lista "filtrów" */
        Column
        {
           spacing: 2



           //TreeView {}  /* Przykłądowe */   // Niby "rozwijane drzewo"
           //ItemSelectionModel { id: sel; model: fileSystemModel }


           Text
           {
              font.pointSize: 13
              text: qsTr("Jakie modyfikacje chcesz wprowadzić do obrazu?")
           }



           /* lista checboxów */    // https://doc.qt.io/qt-5/qml-qtquick-controls2-checkbox.html
           Column {
               /*ButtonGroup {
                   id: childGroup
                   exclusive: false
                   checkState: parentBox.checkState
               }*/

               CheckBox {
                   id: checkBox1
                   checked: false
                   text: qsTr("Obrót obrazka")

                   onCheckedChanged: function()
                            {
                               if( checkBox1.checked === true )
                               {
                                   console.log( "zaznaczono" )
                                   okienkoObrot.visible = true
                               }
                               else
                                   console.log( "odznaczono" )

                           }
                   //checkState: childGroup.checkState
               }

               CheckBox {
                   id: checkBox2
                   text: qsTr("Korekta RGB")

                   onCheckedChanged: function()
                            {
                               if( checkBox2.checked === true )
                               {
                                   console.log( "zaznaczono" )
                                   okienkoRGB.visible = true
                               }
                               else console.log( "odznaczono" )
                           }
                   //checkState: childGroup.checkState
               }

               CheckBox {
                   id: checkBox3
                   text: qsTr("Przezucanie obrazu / Flip")
                   //leftPadding: indicator.width //ButtonGroup.group: childGroup

                   onCheckedChanged: function()
                   {
                       if( checkBox3.checked === true)
                       {
                           console.log( "zaznaczono" )
                           okienkoFlip.visible = true
                       } else console.log( "odznaczono" )
                   }
               } // checbox

               CheckBox {
                   id: checkBox4
                   text: qsTr("Przesuniecie obrazu")

                   onCheckedChanged: function()
                   {
                       if( checkBox4.checked === true)
                       {
                           console.log( "zaznaczono" )
                           okienkoPrzesuniecieObrazu.visible = true
                       } else console.log( "odznaczono" )
                   }
               } // checbox

               CheckBox {
                   id: checkBox5
                   text: qsTr("Filtr szarości")

                   onCheckedChanged: function()
                   {
                       if( checkBox5.checked === true)
                       {
                           console.log( "zaznaczono" )
                           // tu chyba nie bedzie osobnego okna , okienkoPrzesuniecieObrazu.visible = true
                       } else console.log( "odznaczono" )
                   }
               } // checbox

               CheckBox {
                   id: checkBox6
                   text: qsTr("Zerowanie kanału (R,G lub B)")

                   onCheckedChanged: // cosik jak jakas szalona funkcja, hej!, function()
                   {
                       if( checkBox6.checked === true)
                       {
                           console.log( "zaznaczono" )
                           okienkoZerowanieKanalu.visible = true
                       } else console.log( "odznaczono" )
                   }
               } // checbox


           }

           Text
           {
               id: text2
               text: qsTr("Filtry (kliknij aby dodac do listy)")
               font.pointSize: 15

           }

           /* Spróbowac zrozumieć */
           TreeView
           {
               id: rozwijaneDrzewo            //anchors.fill: parent //anchors.margins: 2 * 12 + row.height
               model: fileSystemModel //index ???
               rootIndex: rootPathIndex
               selection: sel

               TableViewColumn
               {
                   title: "Przekrztałcenie obrazu"
                   role: "fileName"
                   resizable: true
                   horizontalAlignment : Text.AlignRight
                   width: 70
               }


               TableViewColumn
               {
                   title: "Komentarz"
                   role: "komentarz"
                   resizable: true
               }

               onActivated : {
                   console.log("Wybrano: " + index)
               }
           }
         }


        Column // ta trzecia z juz wybranymi filtrami
        {
           spacing: 2

           Text
           {
               text: qsTr("Wybrane filtry (któRe będą wykorzytane)")
               font.pointSize: 13
           }

           // Niby wybrane filtry


           ListModel // Kontener z danymi
           {
               id: adam
               ListElement {
                   name: "Fitr: Obrót"
                   opcje: "A B C"

               }
               ListElement {
                   name: "Filtr: Koczkodan"
                   opcje: "A B C"
               }
               ListElement {
                   name: "Filtr: Mitsubiszi"
                   opcje: "A B C"
               }
           }


           ListView
           {
               width: 180; height: 200

               model: adam  // źródło danych, ID //repeater: [ text: adam.name, ": ", adam.number ]
               delegate: Row {  // zeby zamknac to w jendym i by byc to linia

                   Text {  text: name + ": " + opcje; font.pointSize: 13; }
                   CheckBox {}
               }
           }


           Text
           {
               id: text4
               text: qsTr("Kontrola nad demonicznymi filtrami")
               font.pointSize: 13
           }


           Row  // bo to poziomo Milordzie ma być //Przyciski
           {
               //anchors.top: parent.top
               //anchors.topMargin: 12
               //anchors.horizontalCenter: parent.horizontalCenter

               //ExclusiveGroup { id: eg }

               // Jakoś porozsuwac przyciski
               Repeater
               {
                   model: [ "usuń", "Zduplikuj", "nałóż fltry", "Zapisz" ]

                   Button
                   {
                       text: modelData //modelData to dane z Ripitera
                       //exclusiveGroup: eg
                       //checkable: true // że nacisniej i juz tak zostanie xD
                       checked: index = 0  // ===
                       onClicked: view.selectionMode = index

                   }
               }
           } //Row
        }




        Column // Kolumna 4. wyniki
        {
           spacing: 2

           Text
           {
               id: text5
               text: qsTr("Podgląd zdjęcia po przekrztałceniach")
               font.pointSize: 13
           }

           Text
           {
               id: text5_
               text: qsTr("Podejscie 1.")
               font.pointSize: 13
           }

           Image // podglad 1 (zdjecia)
           {
               width: 120; height: 120
               fillMode: Image.TileHorizontally
               verticalAlignment: Image.AlignLeft
               source: "file:abc.png"
           }

           Text
           {
               id: text5__
               text: qsTr("Podejscie 2.")
               font.pointSize: 13
           }

           Image // podglad 2 (zdjecia)
           {
               width: 120; height: 120
               fillMode: Image.TileHorizontally
               verticalAlignment: Image.AlignLeft
               source: "file:abc.png"
           }

           Button { //Przycisk mozna alteratywnie zorbić za pomoacą Rectangle
               text: "Odświerz podgląd zdjecia"
           }

           CheckBox
           {
               text: qsTr("Podgląd wygenerowanego obrazu na żywo")
               checked: true
           }
           CheckBox
           {
               text: qsTr("Bonus 1")
           }
           CheckBox
           {
               text: qsTr("Bonus 2")
           }

         }
    }
    //Koniec: "Dodane"

}







