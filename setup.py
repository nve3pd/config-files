import glob
import os
import shutil


dotfiles = glob.glob(".*")
dotfiles.remove(".git")
dotfiles.remove(".bashrc")

def main():
    for f in dotfiles:
        if os.path.exists("~/" + f):
            n = input("The file already exists.\nDo you want to overwrite?[y/n] ")
            if n != "n":
                shutil.move(f, os.path.expanduser("~"))
                print(f + " moved to home dir")
        else:
            shutil.copy(f, os.path.expanduser("~"))
            print(f + " moved to home dir")

if __name__ == "__main__":
    main()
