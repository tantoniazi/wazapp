/****************************************************************************
**
** Copyright (c) 2012, Tarek Galal <tarek@wazapp.im>
**
** This file is part of Wazapp, an IM application for Meego Harmattan
** platform that allows communication with Whatsapp users.
**
** Wazapp is free software: you can redistribute it and/or modify it under
** the terms of the GNU General Public License as published by the
** Free Software Foundation, either version 2 of the License, or
** (at your option) any later version.
**
** Wazapp is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
** See the GNU General Public License for more details.
**
** You should have received a copy of the GNU General Public License
** along with Wazapp. If not, see http://www.gnu.org/licenses/.
**
****************************************************************************/
import QtQuick 1.1
import com.nokia.meego 1.0 
import "../common/js/settings.js" as MySettings;

SelectionDialog {
     id: singleSelectionDialog

     titleText: qsTr("Select status")
     selectedIndex: -1

     model: ListModel {
	  id:presetsModel
     }
     
     property string magic: "[WZPPRST]"
     
     function openDialog() {
	loadPresets()
	singleSelectionDialog.open()
     }
     
     //call not implemented
     function removePreset(preset) {
	consoleDebug(preset)
	var presetsList = []
	var presets = MySettings.getSetting("StatusPresets", "")

	if (presets!="")
		presetsList = presets.split(magic)

	for (var i=0; i<presetsList.length; ++i) {
		consoleDebug(presetsList[i])
		if (presetsList[i]==preset) {
			presetsList.splice(i,1)
			break;
		}
	}

	MySettings.setSetting("StatusPresets", presetsList.join(magic))
     }

    function addRecentPreset(preset) {
	consoleDebug(preset)
	var presetsList = []
	var presets = MySettings.getSetting("StatusPresets", "")

	if (presets!="")
		presetsList = presets.split(magic)

	for (var i=0; i<presetsList.length; ++i) {
		consoleDebug(presetsList[i])
		if (presetsList[i]==preset) {
			presetsList.splice(i,1)
			break;
		}
	}

	presetsList.push(preset)
	MySettings.setSetting("StatusPresets", presetsList.join(magic))
    }
     
     function loadPresets() {
	presetsModel.clear()
	var presets = MySettings.getSetting("StatusPresets", "")
	if (presets.length == 0)
	{
	    presets =qsTr("Available")
	    presets+=magic
	    presets+=qsTr("Busy")
	    presets+=magic
	    presets+=qsTr("At school")
	    presets+=magic
	    presets+=qsTr("At the movies")
	    presets+=magic
	    presets+=qsTr("At work")
	    presets+=magic
	    presets+=qsTr("Battery about to die")
	    presets+=magic
	    presets+=qsTr("Can't talk, WhatsApp only")
	    presets+=magic
	    presets+=qsTr("In a meeting")
	    presets+=magic
	    presets+=qsTr("At the gym")
	    presets+=magic
	    presets+=qsTr("Sleeping")
	    presets+=magic
	    presets+=qsTr("Urgent calls only")
	    presets+=magic
	    presets+=qsTr("I love Wazapp")
	    MySettings.setSetting("StatusPresets", presets)
	}
	var presetsList = presets.split(magic)
	while (presetsList.length>0)
	    presetsModel.append({"name": presetsList.pop()});
     }

     onSelectedIndexChanged: {
	status_text.text = singleSelectionDialog.model.get(singleSelectionDialog.selectedIndex).name
     }

}
