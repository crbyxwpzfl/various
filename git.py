import subprocess
#import privates variable
import sys
import os
sys.path.append(os.path.join(os.path.expanduser("~"), "Desktop", "private"))
import privates


def pull():
    output = subprocess.run(['git', '-c', 'user.name="crbyxwpzfl"', '-c', 'user.email=socials.fl@icloud.com', '-c' , privates.sshcmd,  'pull', 'origin', 'main'])

def forcepull():
    savety = input('all local data will be overwritten to continue enter continue ')
    if savety == "continue":
        output = subprocess.run(['git', 'fetch', '--all'])
        output = subprocess.run(['git', 'reset', '--hard', 'origin/main'])
        output = subprocess.run(['git', 'branch', '-m', 'main'])
        output = subprocess.run(['git', '-c', 'user.name="crbyxwpzfl"', '-c', 'user.email=socials.fl@icloud.com', '-c' , privates.sshcmd,  'pull', 'origin', 'main'])
    else:
        print(f"recived \"{savety}\" aborted force pull")

def init():
    output = subprocess.run(['git', 'init'])
    output = subprocess.run(['git', 'branch', '-m', 'main'])
    repo = input('enter reposetory name ')
    output = subprocess.run(['git', 'remote', 'add', 'origin', f"git@github.com:crbyxwpzfl/{repo}.git"])

def add():
    output = subprocess.run(['git', 'add', '.'])

def commit():
    cmess = input('enter commit message ')
    output = subprocess.run(['git', '-c', 'user.name="crbyxwpzfl"', '-c', 'user.email=60987359+crbyxwpzfl@users.noreply.github.com', 'commit', '-m', cmess])

def push():
    output = subprocess.run(['git', '-c', privates.sshcmd, 'push', 'origin', 'main'])

def forcepush():
    output = subprocess.run(['git', '-c', privates.sshcmd, 'push', 'origin', 'main', '--force'])

def status():
    #print git status and ask what to do
    print()
    print()
    output = subprocess.run(['git', 'status'])
    print()
    print()
    global frage
    frage = input('(pull) or (forcepull) or (i)nit or (a)dd or (c)ommit or (p)ush or (f)orcepush or (n)othing ')

    if str(frage) == "pull":
        pull()
        status()
    
    if str(frage) == "forcepull":
        forcepull()
        status()

    if str(frage) == "i":
        init()
        status()

    if str(frage) == "a":
        add()
        status()

    if str(frage) == "c":
        commit()
        status()

    if str(frage) == "p":
        push()
        status()

    if str(frage) == "f":
        forcepush()
        status()
    
    sys.exit()

status()
