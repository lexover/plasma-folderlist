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

#include <QtQml>
#include "process.h"
#include <QDesktopServices>

Process::Process(QObject *parent) : QProcess(parent) {
}

Process::~Process() {
}

void Process::start2(const QString &path) {
        QStringList args;

        // convert QVariantList from QML to QStringList for QProcess

      //  for (int i = 0; i < arguments.length(); i++) {
       //     args << arguments[i].toString();
      //  }
        QDesktopServices::openUrl( QUrl::fromLocalFile( path ) );

       // start(program, args);
}
