import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3
import QtQuick.Layouts 1.2
import Tutorial 1.0

Rectangle {
	width: 200
	height: 200
	color: "#F0F0F0"

	Stats {
		id: myStats
		onDataChanged: console.log(myStats.filename)
	}

	FileDialog {
		id: fileDialog
		title: "Choose a data file"
		onAccepted: myStats.filename = fileDialog.fileUrl.toString().substring(7)
	}


	Text {
			id: titleText
			text: "Stat Calculator"
			anchors.top: parent.top
			anchors.horizontalCenter: parent.horizontalCenter
	}

	Button {
		id: loadButton
		anchors.top: titleText.bottom
		anchors.left: parent.left
		anchors.right: parent.right
		text: "Load file"
		onClicked: fileDialog.open()
	}

	GridLayout {
		anchors.top: loadButton.bottom
		anchors.bottom: parent.bottom
		anchors.left: parent.left
		anchors.right: parent.right

		columns: 2

		Text {text: "X mean"}
		Text {text: myStats.x_mean}
		Text {text: "Y mean"}
		Text {text: myStats.y_mean}
	}
}
