// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../common"
import com.nokia.meego 1.0
import com.nokia.extras 1.0
WAPage {

    property string operation:qsTr("Initializing")
    property string subOperation:""
    property string version:waversion
    orientationLock: PageOrientation.LockPortrait

	property int curProgress
	property int maximumValue
	property int currentValue

    function setCurrentOperation(op) {
		progress.opacity = 0
        subOperation = ""
		if (op=="contacts") operation = qsTr("Loading Contacts")
		else if (op=="convs") operation = qsTr("Loading Conversations")
		else if (op=="phone") operation = qsTr("Loading Phone Contacts")
    }

    function setSubOperation(subop) {
        subOperation = subop
    }

	function setProgressMax(val) {
		maximumValue = val
	}

	function addProgress() {
		currentValue = currentValue +1
		setProgress(currentValue)
	}

	function setProgress(val) {
		var part = 100/maximumValue
		curProgress = parseInt(part*val /10)
	}

	function resetProgress() {
        progress.opacity = 1
		curProgress = 0
		currentValue = 0
	}

    onStatusChanged: {
      /*  if(status == PageStatus.Activating){
            appWindow.showStatusBar = false
            appWindow.showToolBar = false
        } else if(status == PageStatus.Deactivating) {
              appWindow.showStatusBar = true
              appWindow.showToolBar = true
        }*/
    }

    Image {
        id: name
        source: "../common/images/splash/wasplash90.png"
        anchors.fill: parent
        smooth: true

    }

    Column{
        width:parent.width
		spacing: 20
        y:450

        Label{
            text:operation
            color: "gray"
            horizontalAlignment: Text.AlignHCenter
            //font.bold: true
            width:parent.width
        }

		Image {
			id: progress
			width: 55
			height: 55
			smooth: true
            visible: true
			opacity: 0
			anchors.horizontalCenter: parent.horizontalCenter
			source: "images/" + curProgress + "0.png"
        }

        /*Label{
            text:subOperation
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            width:parent.width
        }*/
    }

    Label{
        text:version
        width:parent.width
        horizontalAlignment: Text.AlignHCenter
        color:"#269f1a"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
		opacity: 0.8
    }

}
