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
     
     function openDialog(textarea) {
	loadPresets()
	singleSelectionDialog.open()
	if (singleSelectionDialog.selectedIndex > -1)
	    textarea.text = singleSelectionDialog.model.get(singleSelectionDialog.selectedIndex).name
     }
     
     function loadPresets() {
	var presets = MySettings.getSetting("StatusPresets", "")
	if (presets.length == 0)
	{
	    presets ="Available"
	    presets+=magic
	    presets+="Busy"
	    presets+=magic
	    presets+="At school"
	    presets+=magic
	    presets+="At the movies"
	    presets+=magic
	    presets+="At work"
	    presets+=magic
	    presets+="Battery about to die"
	    presets+=magic
	    presets+="Can't talk, WhatsApp only"
	    presets+=magic
	    presets+="In a meeting"
	    presets+=magic
	    presets+="At the gym"
	    presets+=magic
	    presets+="Sleeping"
	    presets+=magic
	    presets+="Urgent calls only"
	    presets+=magic
	    presets+="I love Wazapp"
	    MySettings.setSetting("StatusPresets", presets)
	}
	var presetsList = presets.split(magic)
	while (presetsList.length>0)
	    presetsModel.append({"name": qsTr(presetsList.pop())});
     }

     onSelectedIndexChanged: {
	status_text.text = singleSelectionDialog.model.get(singleSelectionDialog.selectedIndex).name	
     }

}
