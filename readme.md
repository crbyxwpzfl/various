<p align="center">
<img src="https://cdn2.iconfinder.com/data/icons/social-icons-33/128/Github-512.png">
</p>

## hidetitle bar of a windows window

## plink for ssh sach

## toggle windows theme with a powershell one liner
```powershell
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"  /v SystemUsesLightTheme | 
Select-Object -first 3 | 
Select-Object -last 1 | 
%{
   if($_ -match "0x1"){
       New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 0 -Type Dword -Force;
       New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0 -Type Dword -Force
   }
   else{
       New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 1 -Type Dword -Force;
       New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 1 -Type Dword -Force
   }
}
```
