## git.py dependencies
change `path\to\privates.py`, with `sshcmd` variable, inside `git.py`
add `path\to\gists` to `PATH` env variable for global putty<br>

## putty
putty stores sessions in registry
`regedit /e "%USERPROFILE%\Desktop\putty.reg" HKEY_CURRENT_USER\Software\SimonTatham` to export putty session and settings to desktop<br>

## autohotkey toggle window titlebar
```autohotkey
WinSet, Style, ^0xC00000, A
```

## windows registry default shell
`Computer\HKEY_CLASSES_ROOT\batfile\shell\open\command`<br>
default `"%1" %*`

## windows registry custom desktop context menu
add key `HKEY_CLASSES_ROOT\Directory\Background\shell\name-in-menu\command`<br>
edit value of key (Default) to `path\to\executable`

## windows explorer add files into strart menu
`C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs`

## windows registry win+druck screenshot save dir
`Computer\HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders`<br>
edit value for key `{B7BEDE81-DF94-4682-A7D8-57A52620B86F}`

## windows registry remove services
`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services`<br>
get name of service by opening properties

## windows registry remove ghosts from task man startup list
`Computer\HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run`

## windows registry titlebar size
`HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics`<br>
deafults CaptionHeigt -330,CaptionWidth -330,ScrollHeigt -255,ScrollWidth -255,PaddedBorder -60


## windows open edge minimal window
```powershell
cd "C:\Program Files (x86)\Microsoft\Edge\Application"; start msedge.exe --app=https://github.com/crbyxwpzfl
```
