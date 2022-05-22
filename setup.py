import sys
from cx_Freeze import setup, Executable


# Add new python packages here in packages
build_exe_options = {'include_msvcr': True, "packages": ["os", "sys", "pandas", "numpy", "PySide2", "pickle", "sklearn", "scipy"],
                    "include_files": ['src/qml', ('src/controller', "lib/controller"), 'src/assets']}

base = None
if sys.platform == "win32":
    base = "Win32GUI"

setup(name = "Battle Simulator",
    version = "0.1",
    description = "Battle simulator app",
    options = {"build_exe": build_exe_options},
    executables = [Executable("src/app.py",targetName = "battle simulator.exe", base = base)])
