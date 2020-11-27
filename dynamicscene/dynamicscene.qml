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

import QtQuick 2.0
import QtQuick.Particles 2.0
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import "content"

Item {
    id: window
    FontLoader { id: font; source: "content/fonts/ghostclan.ttf" }

    property int activeSuns: 0
    property int centerOffset: 72

    height: 480; width: 620

   // background
    Rectangle {
        id: background
        anchors.fill: parent
        Image {
            id: background_img
            anchors.fill: parent
            source: "content/images/bg1.png"
        }
        Image {
            id: logo
            width: 150
            height: 150
            z: 10
            anchors.horizontalCenter: background.horizontalCenter
            anchors.top: background.top
            anchors.topMargin: 20
            source: "content/images/millionaire.png"
        }
    }

    Rectangle {
        id: name_textbox
        width: window.width / 2 - 10
        height: window.height / 3
        color: "white"
        opacity: 0.5
        layer.enabled: true
        anchors.centerIn: parent
        anchors.topMargin: 10
        Rectangle {
            anchors.centerIn: parent
            height: enter_name.height + input_name.height
            width: enter_name.width + input_name.width
            Label {
                id: enter_name
                text: "Enter your name"
                font.family: font.name
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 25
                font.bold: true
                font.capitalization: Font.AllUppercase
            }
            TextField {
                id: input_name
                font.family: font.name
                anchors.top: enter_name.bottom
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 18
            }
        }
    }

    //Popup open list room
    Rectangle {
        id: popupToolbox
        z: 1
        width: popupColumn.width
        height: popupColumn.height
        color: "transparent"

        property bool poppedUp: false
        property int downY: window.width - (popupButton.width)
        property int upY: window.width - (popupColumn.width)
        x: poppedUp ? upY : downY
        Behavior on x { NumberAnimation {}}

        Column {
            id: popupColumn
//            y: 8
            spacing: 8

            Row {
                height: popupButton.height
                spacing: 8
                Button {
                    id: popupButton
                    width: 32
                    height: 32
                    Image {
                        anchors.fill: parent
                        source: "content/images/list (1).png"
                        fillMode: Image.Tile
                    }
                    onClicked: popupToolbox.poppedUp = !popupToolbox.poppedUp
                }

            }

            Rectangle {
                color: "transparent"
                width: 260; height: window.height
                Row {
                    spacing: 0
                    Rectangle {
                        id: blank
                        width: popupButton.width
                        height: window.height
                        color: "transparent"
                    }
                    // list view rooms

                    Rectangle {
                        id: listRoom
                        width: 260
                        height: window.height
                        color: "white"
                        opacity: 0.5
                        layer.enabled: true
//                        ListView {
//                            width: parent.width; height: parent.height
//                            required model

//                            delegate: Rectangle {
//                                required property string name

//                                height: 25
//                                width: 100
//                                Text { text: parent.name }
//                            }
//                        }
                    }
                }
            }
        }
    }

    //! [top-level transitions]
    transitions: Transition {
        PropertyAnimation { duration: 3000 }
        ColorAnimation { duration: 3000 }
    }
    //! [top-level transitions]
}
