from signal import signal
from PySide2.QtCore import QObject, Slot, Signal
import json
import pickle
from sklearn.ensemble import RandomForestClassifier
import pandas as pd


class Controller(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.model = None
        self.get_model()

    # Create a signal that accepts a string variable
    alert = Signal(str)
    fight_res = Signal(str)

    # Create a function that gets called when main.qml rendering is completed we will emitt an alert
    @Slot(str)
    def completed(self, msg):
        self.alert.emit(msg)
    
    @Slot(str, str, str)
    def fight_pred(self, model_data, name1, name2):
        data = json.loads(model_data)
        model_input = pd.DataFrame.from_dict(data, orient ='index').transpose()
        res = self.model.predict(model_input)
        if res == 0:
            self.alert.emit(f'{name2} wins!')
        if res == 1:
            self.alert.emit(f'{name1} wins!')
        if res == 2:
            self.alert.emit('Draw!')

    def get_model(self):
        relative_path = "assets/superheroe_model.sm"
        file = open(relative_path, "rb")
        self.model = pickle.load(file)
        file.close()

