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




import QtQuick 2.0
import QtQuick.Dialogs 1.2  //dla FileDailog
import QtQuick.Controls 1.5 // dla TreeViewer, wyżej niz 1.5 TreeView nie działa, wyswetla błąd
import Local 1.0

// Co to ?
import QtQml.Models 2.2 //import io.qt.examples.quick.controls.filesystembrowser 1.0


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
    width: 640
    height: 480
    visible: true

    property string scieszka


    /*Row {   //Przyciski
        id: row
        anchors.top: parent.top
        anchors.topMargin: 12
        anchors.horizontalCenter: parent.horizontalCenter

        ExclusiveGroup { id: eg }

        Repeater {
            model: [ "None", "Single", "Extended", "Multi", "Contig."]
            Button {
                text: modelData
                exclusiveGroup: eg
                checkable: true
                checked: index === 1
                onClicked: view.selectionMode = index
            }
        }
    } */





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


    // ZADANIE
    Row
    {
        id: view_a
        spacing: 5 //spacing: rect.myMargin
        //property int rows:        repeater.model.entryCount
        //property int singleWidth: ( (rect.width-scale.width)/rows ) -rect.myMargin


        Column //1
        {
            spacing: 2

            Rectangle  //Przycisk (z zadania)
            {
                id: loadImage_b
                border.color: "black"
                border.width: 3

                //anchors.right: parent.right
                //anchors.verticalCenter: parent.verticalCenter
                //anchors.margins: 7

                radius: 10
                height: 50 //maxField.height*1.4
                width:  200 //maxField.width*1.4

                property string bText: qsTr("Laod an Image");



                /* Text //jaka jest potzrebna max szeroksoc xD
                {
                    id: maxField
                    text: qsTr("Single")
                    font.pointSize: 13
                    opacity: 0
                }*/

                Text
                {
                    id: buttonText_a
                    anchors.centerIn: parent
                    text: loadImage_b.bText
                    font.pointSize: 13
                }

                MouseArea  //akcje
                {
                    anchors.fill: parent
                    onPressed: { loadImage_b.color = "blue" } //"lightGray" }
                    onClicked: { okienkoWyborPliku.visible = true }  //{ } // header.toggle() }

                    //onReleased: { loadImage_b.color = "white" }


               }
            }

            Rectangle  //Przycisk 2 (z zadania)
            {
                id: quickImage_b
                border.color: "black"
                border.width: 3

                //anchors.right: parent.right
                //anchors.verticalCenter: parent.verticalCenter
                //anchors.margins: 7

                radius: 10
                height: 50 //maxField.height*1.4
                width:  200 //maxField.width*1.4

                property string bText: qsTr("Quick an Image");



                /* Text //jaka jest potzrebna max szeroksoc xD
                {
                    id: maxField
                    text: qsTr("Single")
                    font.pointSize: 13
                    opacity: 0
                }*/

                Text
                {
                    id: buttonText_b
                    anchors.centerIn: parent
                    text: quickImage_b.bText
                    font.pointSize: 13
                }

                MouseArea  //akcje
                {
                    anchors.fill: parent
                    onPressed: { quickImage_b.color = "blue" } //"lightGray" }
                    onClicked: { } // header.toggle() }
                    onReleased: { quickImage_b.color = "white" }
                }
            }

            Rectangle { color: "red";  width: 50;  height: 50 }
            Rectangle { color: "green"; width: 20; height: 50 }
            Rectangle { color: "blue";  width: 50; height: 20 }

            Text
            {
                id: name
                text: qsTr("Last loaded image")
            }

            Rectangle  //Przycisk 2 (z zadania)
            {
                id: selectImage_b
                border.color: "black"
                border.width: 3

                //anchors.right: parent.right
                //anchors.verticalCenter: parent.verticalCenter
                //anchors.margins: 7

                radius: 10
                height: 50 //maxField.height*1.4
                width:  200 //maxField.width*1.4

                property string bText: qsTr("Select an Image");



                /* Text //jaka jest potzrebna max szeroksoc xD
                {
                    id: maxField
                    text: qsTr("Single")
                    font.pointSize: 13
                    opacity: 0
                }*/

                Text
                {
                    id: selectImage_Text
                    anchors.centerIn: parent
                    text: selectImage_b.bText
                    font.pointSize: 13
                }

                MouseArea  //akcje
                {
                    anchors.fill: parent
                    onPressed: { selectImage_b.color = "blue" } //"lightGray" }
                    onClicked: { } // header.toggle() }
                    onReleased: { selectImage_b.color = "white" }
                }
            }

            Text
            {
                id: name1
                text: qsTr("Currently loaded Image:")
            }

            BorderImage
            {
                id: name2

                width: 100; height: 100

                border.left: 5; border.top: 5
                border.right: 5; border.bottom: 5

                source: oknoGlowne.scieszka //"file:abc.png"

                //fillMode: Image.TileHorizontally
                //verticalAlignment: Image.AlignLeft

            }
        }


        Column //2
        {
           spacing: 2

           Text
           {
               id: text1
               text: qsTr("sdfsdf")
               font.pointSize: 13
           }

           Text
           {
               id: text2
               text: qsTr("tu bedzie ta rozwijana list")
               font.pointSize: 13
           }

           TreeView  /* Przykłądowe */
           {
               model: fileSystemModel

               TableViewColumn
               {
                   title: "Name"
                   role: "fileName"
                   width: 30
               }
               TableViewColumn
               {
                   title: "Permissions"
                   role: "filePermissions"
                   width: 10
               }

           }

           ItemSelectionModel { id: sel; model: fileSystemModel }

           TreeView  /* Skopiowanie */
           {
               id: view_2             //anchors.fill: parent //anchors.margins: 2 * 12 + row.height
               model: fileSystemModel
               rootIndex: rootPathIndex
               selection: sel

               TableViewColumn
               {
                   title: "Przekrztałcenie obrazu"
                   role: "fileName"
                   resizable: true
               }

               TableViewColumn
               {
                   title: "Size"
                   role: "size"
                   resizable: true
                   horizontalAlignment : Text.AlignRight
                   width: 70
               }

               TableViewColumn
               {
                   title: "Permissions"
                   role: "displayableFilePermissions"
                   resizable: true
                   width: 100
               }

               TableViewColumn
               {
                   title: "Date Modified"
                   role: "lastModified"
                   resizable: true
               }

               onActivated : {
                   var url = fileSystemModel.data(index, FileSystemModel.UrlStringRole)
                   Qt.openUrlExternally(url)
               }
           }




         }


        Column //3
        {
           spacing: 2

           Text
           {
               id: text3
               text: qsTr("Tu bedzie lista z dokonanymi wyborami")
               font.pointSize: 13
           }

           Text
           {
               id: text4
               text: qsTr("Jakiś opis tego co jest poniżej")
               font.pointSize: 13
           }

           Rectangle // Przycisk delete
           {
               width: 100
               height: 100
               //color: "blue"
               border.color: "black"
               border.width: 3
               radius: 10
               Text{ text: "sdfsdfs"; font.pointSize: 13; }
           }


           Rectangle // Przycisk duplicate
           {
               width: 100
               height: 100
               //color: "blue"
               border.color: "black"
               border.width: 3
               radius: 10
               Text{ text: "sdfsdfs"; font.pointSize: 13; }
           }
         }




        Column //4
        {
           spacing: 2

           Text
           {
               id: text5
               text: qsTr("No to 4 kolumna. jakiś tekst.")
               font.pointSize: 13
           }

           Image // podglad 1 (zdjecia)
           {
               width: 120; height: 120
               fillMode: Image.TileHorizontally
               verticalAlignment: Image.AlignLeft
               source: "file:abc.png"
           }

           Image // podglad 2 (zdjecia)
           {
               width: 120; height: 120
               fillMode: Image.TileHorizontally
               verticalAlignment: Image.AlignLeft
               source: "file:abc.png"
           }

           Rectangle  // przycisk po coś tam
           {
             color: "red";  width: 50;  height: 50
             border.color: "black"; border.width: 2
             Text { font.pointSize: 13; text: qsTr("Refres (...)" ) }
           }


           Text
           {
               id: text6
               text: qsTr("tu bedzie ta rozwijana list")
               font.pointSize: 13
           }
         }


        Column //100
        {
            spacing: 2


            Rectangle { color: "red";  width: 50;  height: 50 }
            Rectangle { color: "green"; width: 20; height: 50 }
            Rectangle { color: "blue";  width: 50; height: 20 }
        }


    }
    //Koniec: "Dodane"





    SatelliteModel
    {
        id: satelliteModel
        running: true
        onErrorFound: errorLabel.text = qsTr("Last Error: %1", "%1=error number").arg(code)
    }

    Item
    {
        id: header
        height: column.height + 30
        width: parent.width
        state: "running"
        opacity: 0

        anchors.top: parent.top

        function toggle()
        {
            switch (header.state) {
            case "single": header.state = "running"; break;
            default:
            case "running": header.state = "stopped"; break;
            case "stopped": header.state = "single"; break;
            }
        }

        function enterSingle()
        {
            satelliteModel.singleRequestMode = true;
            satelliteModel.running = true;
        }

        function enterRunning()
        {
            satelliteModel.running = false;
            satelliteModel.singleRequestMode = false;
            satelliteModel.running = true;
        }

        states: [
            State {
                name: "stopped"
                PropertyChanges { target: startStop; bText: qsTr("Single") }
                PropertyChanges {
                    target: modeLabel; text: qsTr("Current Mode: stopped")
                }
                PropertyChanges { target: satelliteModel; running: false; }
            },
            State {
                name: "single"
                PropertyChanges { target: startStop; bText: qsTr("Start") }
                PropertyChanges {
                    target: modeLabel; text: qsTr("Current Mode: single")
                }
                StateChangeScript { script: header.enterSingle(); }
            },
            State {
                name: "running"
                PropertyChanges { target: startStop; bText: qsTr("Stop") }
                PropertyChanges {
                    target: modeLabel; text: qsTr("Current Mode: running")
                }
                StateChangeScript { script: header.enterRunning(); }
            }
        ]

        Column {
            id: column
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.margins: 7
            Text {
                id:  overview
                text: satelliteModel.satelliteInfoAvailable
                      ? qsTr("Known Satellites")
                      : qsTr("Known Satellites (Demo Mode)")
                font.pointSize: 12
            }

            Text {
                id: modeLabel
                font.pointSize: 12
            }

            Text {
                id: errorLabel
                text: qsTr("Last Error: None")
                font.pointSize: 12
            }
        }
        Rectangle {
            id: startStop
            border.color: "black"
            border.width: 3
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 7
            radius: 10
            height: maxField.height*1.4
            width: maxField.width*1.4

            property string bText: qsTr("Stop");

            Text { //need this for sizing
                id: maxField
                text: qsTr("Single")
                font.pointSize: 13
                opacity: 0
            }

            Text {
                id: buttonText
                anchors.centerIn: parent
                text: startStop.bText
                font.pointSize: 13
            }

            MouseArea {
                anchors.fill: parent
                onPressed: { startStop.color = "lightGray" }
                onClicked: { header.toggle() }
                onReleased: { startStop.color = "white" }
            }
        }
    }

    Rectangle
    {
        anchors.top: header.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: rect.myMargin

        border.width: 3
        radius: 10
        border.color: "black"
        opacity: 0
        visible: false


        Item {
            id: rect
            anchors.fill: parent
            anchors.margins: myMargin
            property int myMargin: 7

            Row {
                id: view_cvc
                property int rows: repeater.model.entryCount
                property int singleWidth: ((rect.width - scale.width)/rows )-rect.myMargin
                spacing: rect.myMargin

                Rectangle {
                    id: scale
                    width: strengthLabel.width+10
                    height: rect.height
                    color: "#32cd32"
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: lawngreenRect.top
                        font.pointSize: 11
                        text: "50"
                    }
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        font.pointSize: 11
                        text: "100"
                    }

                    Rectangle {
                        id: redRect
                        width: parent.width
                        color: "red"
                        height: parent.height*10/100
                        anchors.bottom: parent.bottom
                        Text {
                            id: strengthLabel
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.bottom: parent.bottom
                            font.pointSize: 11
                            text: "00"
                        }
                    }
                    Rectangle {
                        id: orangeRect
                        height: parent.height*10/100
                        anchors.bottom: redRect.top
                        width: parent.width
                        color: "#ffa500"
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.bottom: parent.bottom
                            font.pointSize: 11
                            text: "10"
                        }
                    }
                    Rectangle {
                        id: goldRect
                        height: parent.height*10/100
                        anchors.bottom: orangeRect.top
                        width: parent.width
                        color: "#ffd700"
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.bottom: parent.bottom
                            font.pointSize: 11
                            text: "20"
                        }
                    }
                    Rectangle {
                        id: yellowRect
                        height: parent.height*10/100
                        anchors.bottom: goldRect.top
                        width: parent.width
                        color: "yellow"
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.bottom: parent.bottom
                            font.pointSize: 11
                            text: "30"
                        }
                    }
                    Rectangle {
                        id: lawngreenRect
                        height: parent.height*10/100
                        anchors.bottom: yellowRect.top
                        width: parent.width
                        color: "#7cFc00"
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.bottom: parent.bottom
                            font.pointSize: 11
                            text: "40"
                        }
                    }
                }

                Repeater {
                    id: repeater
                    model: satelliteModel
                    delegate: Rectangle {
                        height: rect.height
                        width: view.singleWidth
                        Rectangle {
                            anchors.bottom: parent.bottom
                            width: parent.width
                            height: parent.height*signalStrength/100
                            color: isInUse ? "#7FFF0000" : "#7F0000FF"
                        }
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.bottom: parent.bottom
                            text: satelliteIdentifier
                        }
                    }
                }
            }
        }
    }
}







