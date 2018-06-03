/*
 * Copyright (C) 2018 by David Baum <david.baum@naraesk.eu>
 *
 * This file is part of plasma-folderlist.
 *
 * plasma-folderlist is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * plasma-folderlist is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with plasma-folderlist.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.5
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3

Item {
    property alias cfg_folder: path.text
    property alias cfg_title: title.text

    GridLayout {
        Layout.fillWidth: true
        width: parent.width
        columns: 3

        Label {
            text: i18n('Directory')
            Layout.alignment: Qt.AlignRight
        }

        TextField {
            id: path
            Layout.fillWidth: true
            placeholderText: "Path to directory"
        }

        Button {
            id: chooseDirectory
            text: i18n("Open")
            icon.name: "folder"
            onClicked: {
                fileDialog.visible = true
            }
        }

        Label {
            text: i18n('Title')
            Layout.alignment: Qt.AlignRight
        }

        TextField {
            id: title
            Layout.fillWidth: true
            placeholderText: i18n("Display name")
            Layout.columnSpan: 2
        }
    }
    FileDialog {
        id: fileDialog
        title: i18n("Please choose a directory")
        folder: shortcuts.home
        selectFolder: true
        visible: false
        onAccepted: {
            var folderPath = fileDialog.folder.toString();
            // remove prefixed "file:///"
            folderPath = folderPath.replace(/^(file:\/{2})|(qrc:\/{2})|(http:\/{2})/,"");
            // unescape html codes like '%23' for '#'
            path.text = decodeURIComponent(folderPath);
            var lastSlash = fileDialog.folder.toString().lastIndexOf("/")
            title.text = fileDialog.folder.toString().substring(lastSlash+1)
        }
    }
}
