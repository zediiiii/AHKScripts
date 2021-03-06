﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; #NoTrayicon
Menu, Tray, Icon, tray.ico,1
Menu, Tray, NoStandard
Menu, Tray, Add, Toggle Touch, Toggle
Menu, Tray, Add, 
Menu, Tray, Standard
Menu, Tray, Default, Toggle Touch

Disabled:=0

Toggle:	; double click tray icon to disable/enable
#0::	; Hotkey to disable/enable
if (Disabled=0) {

;disable usb hardware for battery saving goodness

Run C:\Windows\System32\DevManView.exe /disable "Realtek USB 3.0 Card Reader"	; path to DevManView and disable device with this name/ID
Disabled:=1

Run C:\Windows\System32\DevManView.exe /disable "SDXC Card"	; path to DevManView and disable device with this name/ID
Disabled:=1

Run C:\Windows\System32\DevManView.exe /disable "USB Input Device"	; path to DevManView and disable device with this name/ID
Disabled:=1

Run C:\Windows\System32\DevManView.exe /disable "USB Composite Device"	; path to DevManView and disable device with this name/ID
Disabled:=1

Run C:\Windows\System32\DevManView.exe /disable "USB Root Hub (xHCI)"	; path to DevManView and disable device with this name/ID
Disabled:=1

Menu, Tray, Icon , trayd.ico,,1
ToolTip, USB Devices Disabled	; little tooltip displayed to visualize the current action
SetTimer, RemoveToolTip, 3000
return
}
else {

;re-enable all disabled USB devices

Run C:\Windows\System32\DevManView.exe /enable "Realtek USB 3.0 Card Reader"	; path to DevManView and enable device with this name/ID
Disabled:=0

Run C:\Windows\System32\DevManView.exe /enable "SDXC Card"	; path to DevManView and enable device with this name/ID
Disabled:=0

Run C:\Windows\System32\DevManView.exe /enable "USB Input Device"	; path to DevManView and enable device with this name/ID
Disabled:=0

Run C:\Windows\System32\DevManView.exe /enable "USB Composite Device"	; path to DevManView and enable device with this name/ID
Disabled:=0

Run C:\Windows\System32\DevManView.exe /enable "USB Root Hub (xHCI)"	; path to DevManView and enable device with this name/ID
Disabled:=0


Menu, Tray, Icon , tray.ico,,1
ToolTip, USB Devices Enabled	; little tooltip displayed to visualize the current action
SetTimer, RemoveToolTip, 3000
return
}

RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return