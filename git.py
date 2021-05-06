import subprocess
#import privates variable
import sys
import os
sys.path.append(os.path.join(os.path.expanduser("~"), "Desktop", "private"))
import privates


def pull():
    global branch
    output = subprocess.run(['git', '-c', 'user.name="crbyxwpzfl"', '-c', 'user.email=socials.fl@icloud.com', '-c' , privates.sshcmd,  'pull', 'origin', branch])
    pullsubs = input('want to (p)ull all submodlues aswell or (n)o ')
    if pullsubs == "p":
        output = subprocess.run(['git', '-c', privates.sshcmd,  'submodule', 'update', '--init', '--recursive', '--remote'])

def forcepull():
    global branch
    savety = input('all local data will be overwritten to continue enter continue ')
    if savety == "continue":
        output = subprocess.run(['git', 'fetch', '--all'])
        output = subprocess.run(['git', 'reset', '--hard', f"origin/{branch}"])
        branch = input('put in branch name ')
        output = subprocess.run(['git', 'branch', '-m', branch])
        output = subprocess.run(['git', '-c', 'user.name="crbyxwpzfl"', '-c', 'user.email=socials.fl@icloud.com', '-c' , privates.sshcmd,  'pull', 'origin', branch])
    else:
        print(f"recived \"{savety}\" aborted force pull")

def init():
    global branch
    branch = input('put in branch name ')
    output = subprocess.run(['git', 'init'])
    output = subprocess.run(['git', 'branch', '-m', branch])
    repo = input('enter reposetory name ')
    output = subprocess.run(['git', 'remote', 'add', 'origin', f"git@github.com:crbyxwpzfl/{repo}.git"])

def add():
    global branch
    output = subprocess.run(['git', 'add', '.'])

def commit():
    global branch
    comitmess = input('enter commit message ')
    output = subprocess.run(['git', '-c', 'user.name="crbyxwpzfl"', '-c', 'user.email=60987359+crbyxwpzfl@users.noreply.github.com', 'commit', '-m', comitmess])

def push():
    global branch
    output = subprocess.run(['git', '-c', privates.sshcmd, 'push', 'origin', branch])

def forcepush():
    global branch
    output = subprocess.run(['git', '-c', privates.sshcmd, 'push', 'origin', branch, '--force'])

def addsubs():
    global branch
    subremote = input('input the submodule ssh remote ')
    subpath = input('input the submodule path rel to current dir ./')
    output = subprocess.run(['git', '-c', privates.sshcmd,  'submodule', 'add', subremote, subpath])

def status():
    #print git status and ask what to do
    print()
    print("---------------------------------------------------------------------------")
    output = subprocess.run(['git', 'status'])
    print()

    global branch
    #only git version 2.22 +
    #output = subprocess.Popen(['git', 'branch', '--show-current'], stdout=subprocess.PIPE)
    #print(str(output.stdout.read()).replace("\\n", " ").strip("b''"))
    output = subprocess.Popen(['git', 'rev-parse', '--abbrev-ref', 'HEAD'], stdout=subprocess.PIPE)
    branch = (str(output.stdout.read()).replace("\\n", "").strip("b''")) #this strips b from branch name aswell e.g. blabla will be labla    
    print(f"branch used for next action -{branch}-")

    global frage
    frage = input('p(u)ll or (i)nit or (a)dd change or (c)ommit or (p)ush or add (s)ubmodule or (n)othing ')

    if str(frage) == "u":
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

    if str(frage) == "forcepush":
        forcepush()
        status()

    if str(frage) == "s":
        addsubs()
        status()
    
    sys.exit()

status()
