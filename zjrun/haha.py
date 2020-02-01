import os
import logging,logging.config
import sys
PACMAN_INSTALL = [
    "alacritty",
    "anaconda",
    "fcitx",
    "fcitx-configtool",
    "fcitx-googlepinyin",
    "fcitx-qt5",
    "firefox",
    "fish",
    "google-chrome",
    "neovim",
    "papirus-icon-theme",
    "visual-studio-code-bin",
    "yay",
    "ipython",
]


def get_logger():
    logging.config.fileConfig("./log.conf")
    logger = logging.getLogger()
    return logger

def get_password():
    passwd = intput("sudo密码：")
    return passwd.strip()
def command_exec(command:str):
    g_logger.info(f"exec command: {command}")
    if "sudo" in command:
        pass
    res = os.popen(command)
    g_logger.info(f"{res}")

def install_software(install_list:list):
    cmd = (f"sudo pacman -Syy "+" ".join(install_list))
    return cmd
g_logger = get_logger()

if __name__ == "__main__":
    paawd = get_password()
    command_exec(install_software(PACMAN_INSTALL))
    # install_software(PACMAN_INSTALL)
