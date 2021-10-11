# copy this module to pip packages dir
from os import path, listdir, mkdir, makedirs
import shutil

VERSION = "1.0.0"
METADATA ="""\
Name: {name}
Version: {version}
Summary: Easy to start a project with new vitrual enviroment.
Author: Dragon-GCS
"""

def copyFile(target_dir:str):
    module_dir = path.dirname(__file__)
    module_name = path.basename(module_dir)

    if (path.dirname(module_dir)) == target_dir:
        print(f"Module '{module_name}' is already installed")
        return

    tar = path.join(target_dir, module_name)
    if not path.isdir(tar):
        makedirs(tar)

    for file in listdir(module_dir):
        src = path.join(module_dir, file)
        if path.isfile(src):
            shutil.copy(src, tar)

    # 写入元数据
    info_dir = path.join(target_dir, module_name + ".dist-info")
    if not path.isdir(info_dir):
        mkdir(info_dir)
    with open(path.join(info_dir, "METADATA"), "w") as f:
        f.write(METADATA.format(name = module_name,version=VERSION))

    print(f"module '{module_name}' install to '{target_dir}'")

if __name__ == "__main__":
    import pip
    dirname = path.dirname
    pip_package_dir = path.dirname(path.dirname(pip.__file__))
    copyFile(pip_package_dir)
