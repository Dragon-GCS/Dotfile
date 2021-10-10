# copy this module to pip packages dir
from os import path, listdir
import shutil

def copyFile(target_dir:str):
    module_dir = path.dirname(__file__)
    module_name = path.basename(module_dir)
    for file in listdir(module_dir):
        src = path.join(module_dir, file)
        tar = path.join(target_dir, module_name)
        #print(f"move {src} =>  {tar}")
        shutil.copy(src, tar)
    print(f"module '{module_name}' install to '{target_dir}'")

if __name__ == "__main__":
    import pip
    dirname = path.dirname
    pip_package_dir = path.dirname(path.dirname(pip.__file__))
    copyFile(pip_package_dir)
