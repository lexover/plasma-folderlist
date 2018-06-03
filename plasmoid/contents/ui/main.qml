/*
 * Copyright (C) 2018 by David Baum <david.baum@naraesk.eu>
 *
 * This file is part of plasma-folderview.
 *
 * plasma-folderview is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * plasma-folderview is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with plasma-folderview.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import Qt.labs.folderlistmodel 2.11
import eu.naraesk.folderlist.process 1.0

Item {
    id: root

    Connections {
        target: plasmoid.configuration
        onServicesChanged: folderModel.folder = plasmoid.configuration.folder
    }

    Process {
        id: process
    }

    ColumnLayout {
        width: parent.width
        height: parent.height


        ListView {
            width: parent.width
            height: parent.height

            model: folderModel
            delegate: fileDelegate
            header: header

            FolderListModel {
                id: folderModel
                showFiles: false
                folder: plasmoid.configuration.folder
            }

            Component {
                id: header
                Label {
                    text: plasmoid.configuration.title
                    font.pointSize: 24
                    width: parent.width
                    horizontalAlignment: Qt.AlignHCenter
                }
            }

            Component {
                id: fileDelegate
                ColumnLayout {
                    width: parent.width
                    SystemPalette { id: systemPalette; colorGroup: SystemPalette.Active }
                    Label {
                        id: label
                        width: root.width
                        leftPadding: 10
                        font.pointSize: 18
                        text: fileName
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                process.start2(filePath)
                            }
                        }
                    }

                    Rectangle {
                        height: 1
                        color: systemPalette.dark
                        width: root.width
                        visible: index != folderModel.count - 1
                    }
                }
            }
        }
    }
}
