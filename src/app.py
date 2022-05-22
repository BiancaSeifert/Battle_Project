import sys
import os

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from controller.controller import Controller


if __name__ == "__main__":
    # Get absolute path to qml main file
    qml_path = os.path.join('qml', 'main.qml')
    # Create our Application
    app = QGuiApplication()
    # QQuickStyle.setStyle("Material")
    backend = Controller()
    engine = QQmlApplicationEngine()
    # This is used to pass objects to the QML side of things
    engine.rootContext().setContextProperty("backend", backend)
    engine.load(qml_path)
    # Exit application properly
    root_obj = engine.rootObjects()
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())