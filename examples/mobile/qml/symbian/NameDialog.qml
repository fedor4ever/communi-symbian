/*
* Copyright (C) 2008-2012 J-P Nurmi <jpnurmi@gmail.com>
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*/

import QtQuick 1.1
import com.nokia.symbian 1.1
import "UIConstants.js" as UI

BaseDialog {
    id: dialog

    property alias name: nameField.text

    onStatusChanged: {
        if (status == DialogStatus.Open) {
            nameField.forceActiveFocus();
            nameField.openSoftwareInputPanel();
        }
    }

    Column {
        id: column
        width: parent.width

        Label { text: qsTr("Nick name"); platformInverted: true }
        TextField {
            id: nameField
            inputMethodHints: Qt.ImhNoAutoUppercase | Qt.ImhNoPredictiveText
            errorHighlight: !text.length
            width: parent.width
            platformInverted: true
            Keys.onEnterPressed: dialog.accept()
            Keys.onReturnPressed: dialog.accept()
        }
    }
}
