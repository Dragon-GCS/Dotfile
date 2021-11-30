import os
import sys
import subprocess

from argparse import ArgumentParser
from platform import system

if __name__ == "__main__":
    parse = ArgumentParser("Start a new project with python vitrual environment, move this module to python site-packages dir")
    parse.add_argument("project_name", nargs="?", help="Name of new project")
    parse.add_argument("-P", "--package", default=[], action="extend", nargs="*", help="auto install packages in vitrual environment")
    parse.add_argument("-r", "--requirement", nargs="?", help="requirement file of packages to install")
    parse.add_argument("-n", "--vname", default=".venv", help="Name of virtual environment dir")
    parse.add_argument("-u", "--upgrade", action="store_true", help="upgrade pip to newest version")
    parse.add_argument("-f", "--force", action="store_true", help="Replace the old environment if it was exist")
    parse.add_argument("--default", default=[], action="extend", nargs='*', help="set default packages to installi, write your usual packages in virtual environment")
    parse.add_argument("--remove_default", action="store_true", help="remove default packages")
    args = parse.parse_args()

    default_packages = os.path.dirname(__file__) + "/default_packages.txt"
    # 删除默认安装的包
    if args.remove_default:
        os.remove(default_packages)
    # 保存需要默认安装的包至文件中
    if args.default:
        with open(default_packages, "w") as f:
            f.writelines(map(lambda pack: pack + '\n', args.default))

    if not args.project_name:
        print("Please choose dir to create venv")
        exit()

    # 虚拟环境位置
    env_dir = os.path.join(args.project_name, args.vname)

    # 启动虚拟环境命令
    if system() == "Windows":
        activate_cmd = os.path.abspath(os.path.join(env_dir, "Scripts", "activate[.ps1|.bat]"))
        interpreter_dir = "Scripts"
    else:
        activate_script = os.path.abspath(os.path.join(env_dir, "bin", "activate"))
        activate_cmd = " ".join(["source", activate_script])
        interpreter_dir = "bin"

    # 创建虚拟环境命令
    venv_cmd = [sys.executable, "-m", "venv", env_dir]
    # 使用虚拟环境解释器启动pip
    pip_cmd = [os.path.abspath(os.path.join(env_dir,
                                            interpreter_dir,
                                            os.path.basename(sys.executable))),
               "-m", "pip", "install"]

    # 添加默认安装包
    if os.path.isfile(default_packages):
        with open(default_packages) as f:
            args.package.extend(f.readlines())

    options = []
    # 安装指定包
    if args.package:
        options += args.package

    # 使用文件安装包
    if args.requirement:
        options += ["-r", args.requirement]

    # 虚拟环境检查
    if os.path.isdir(env_dir):
        print(f"File '{env_dir}' was already exists, ", end="")
        if args.force:
            print("it will be removed")
            venv_cmd += ["--clear"]
        else:
            print("Add '-f' or '--force'to remove the old environment")
            print("Or activate the existed vitrual environment by the following command:")
            exit(f"'{activate_cmd}'")

    # 启动安装
    try:
        print("Creating virtual environment")
        subprocess.run(venv_cmd)

        if args.upgrade:
            print("Upgrade pip to newest version")
            subprocess.run(pip_cmd + ["--upgrade", "pip"])

        if options:
            print("Installing packages")
            subprocess.run(pip_cmd + options)

        print("Create environment successed, activate the vitrual environment by the following command:")
        print(activate_cmd)

    except Exception as e:
        print("Build failed")
        print(e)
