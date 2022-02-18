# Linux相关自动化脚本

## nvim/

neovim 配置文件

## .vim/

vim配置文件

## .bashrc

bash配置，启用starship

## start/

* cd至`start`目录后，使用`pip install .` 将包安装至pip的包文件夹中

* `python3 -m start <project_name>` 用于新的python项目时新建虚拟环境并安装指定包

  * `-P` 需要在虚拟环境中安装的包

  * `-r` 安装指定文件中列出的包，与`pip intall -r`一致

  * `-n` 项目内虚拟环境名，默认为`.venv`

  * `-u` 升级pip至最新版本后再进行安装

  * `-f` 如果指定目录内的虚拟环境已经存在，使用此命令可以覆盖现有虚拟环境

  * `--default` 将常用的包保存至文件，每次安装时都会自动安装文件内的包

  * `--remove_default` 删除保存有常用包的文件
