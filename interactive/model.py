"""
A simple module for calculating stats on a file
"""

import numpy as np
from PySide2.QtCore import QObject, Property, Signal
from PySide2.QtQml import QQmlApplicationEngine, qmlRegisterType

class Stats(QObject):
    """ A QML element for handling stats """

    _data = None # The numbers to calculate over
    _filename = "";

    def __init__(self):
        """ Create the Stats object """
        QObject.__init__(self)

    # A signal to indicate that the data file has changed
    dataChanged = Signal()

    @Property(str, notify=dataChanged)
    def filename(self):
        """ The name of the data file """
        return self._filename

    @filename.setter
    def filename(self, name):
        """ Load a new data file """
        self._filename = name
        self._data = np.loadtxt(name)
        self.dataChanged.emit()

    @Property(float, notify=dataChanged)
    def x_mean(self):
        """ The mean of the first column """
        if self._data is None:
            return 0
        return np.mean(self._data[:, 0])

    @Property(float, notify=dataChanged)
    def y_mean(self):
        """ The mean of the second column """
        if self._data is None:
            return 0
        return np.mean(self._data[:, 1])

# Add the Stats element to the QML Tutorial module version 1.0 under the name Stats
qmlRegisterType(Stats, "Tutorial", 1, 0, "Stats")
