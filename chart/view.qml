import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3
import QtQuick.Layouts 1.2
import QtCharts 2.5
import Tutorial 1.0

Rectangle {
  width: 800
  height: 800
  color: "#F0F0F0"

  Stats {
    id: myStats
  }

  FileDialog {
    id: fileDialog
    title: "Choose a data file"
    onAccepted: myStats.filename = fileDialog.fileUrl.toString().substring(7)
  }

  Button {
    id: loadButton
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    text: "Load file"
    onClicked: fileDialog.open()
  }

  ChartView {
    title: "Scatters"
    anchors.top: loadButton.bottom
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    antialiasing: true

    ValueAxis {
	id: axisX
	min: 0
	max: 12
    }

    ValueAxis {
	id: axisY
	min: 0
	max: 40
    }

    ScatterSeries {
      id: series
      name: myStats.filename
	axisX: axisX
	axisY: axisY
    }

    VXYModelMapper {
      model: myStats
      series: series
      xColumn:0
      yColumn:1
    }
  }
}
