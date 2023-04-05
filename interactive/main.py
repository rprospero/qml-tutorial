from PySide2.QtWidgets import QApplication
from PySide2.QtQuick import QQuickView
from PySide2.QtCore import QUrl
import model

# Create an appliction to process all of the events
app = QApplication([])
# Create a window to display the QML file
view = QQuickView()

# Point the window at the QML we created
view.setSource("view.qml")
# Open the window
view.show()
# Run the application
app.exec_()
