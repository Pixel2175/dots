#include <dirent.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

int main() {
  DIR *dir = opendir("/home/pixel/.config/wallpaper/");
  int dir_size = 0;

  srand(time(NULL));

  struct dirent *image;
  image = readdir(dir);
  while (image != NULL) {
    dir_size++;
    image = readdir(dir);
  }
  closedir(dir);
  DIR *wallpapers_folder = opendir("/home/pixel/.config/wallpaper/");
  char wallpapers[dir_size][256];
  int counter = 0;

  while ((image = readdir(dir)) != NULL) {
    if ((strcmp(image->d_name, ".")) != 0 &&
        (strcmp(image->d_name, "..")) != 0) {

      sprintf(wallpapers[counter], "wal -i ~/.config/wallpaper/%s",
              image->d_name);
      counter++;
    }

    image = readdir(dir);
  }
  closedir(dir);

  int add = (int)((double)rand() / RAND_MAX * (counter + 1));
  ;
  while (1) {
    if (add != counter) {
      system(wallpapers[add]);
      system("/home/$USER/.config/startup/update_colors");
      system("/home/$USER/.config/startup/restart_nvim.sh");
      add++;
      sleep(3 * 60);
    } else {
      add = 0;
    }
  }

  return 0;
}
