import QtQuick 1.1
import com.nokia.meego 1.0

Button {
	property string style: "normal"
	property bool colorinverted: false

    platformStyle: ButtonStyle {
		pressedTextColor: "lightgray"
		inverted: theme.inverted || colorinverted		
        pressedBackground: style=="normal"? "image://theme/color3-meegotouch-button-accent-background" :
							"image://theme/color3-meegotouch-button-background-pressed-horizontal-"+style
        checkedBackground: "image://theme/color3-meegotouch-button-background-selected-horizontal-"+style
    }
} 
