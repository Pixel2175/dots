from os import system, listdir
from random import randint
from time import sleep

system("python ./start-apps.py")
files = listdir("/home/pixel/.config/wallpaper/")
while True:
    index = randint(0, len(files) - 1)
    system(f"feh --bg-scale ~/.config/wallpaper/{files[index]}")
    sleep(3 * 60)
