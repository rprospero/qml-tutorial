"""
A simple module for calculating stats on a file
"""

import numpy as np
from PySide2.QtCore import QObject, Property
from PySide2.QtQml import QQmlApplicationEngine, qmlRegisterType

class Stats(QObject):
    """ A QML element for handling stats """

    _data = None # The numbers to calculate over

    def __init__(self):
        """ Create the Stats object """
        QObject.__init__(self)
        self.data_ = np.loadtxt("data.txt")

    @Property(float)
    def x_mean(self):
        """ The mean of the first column """
        return np.mean(self.data_[:, 0])

    @Property(float)
    def y_mean(self):
        """ The mean of the second column """
        return np.mean(self.data_[:, 1])

# Add the Stats element to the QML Tutorial module version 1.0 under the name Stats
qmlRegisterType(Stats, "Tutorial", 1, 0, "Stats")
