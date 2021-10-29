---
Date: 2021-10-28
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Alias: Master.ahk
---

Type: #Type/Code

# Master AHK Script

To simplify the process of running various scripts across multiple `.ahk` files, I consolidate the scripts into a single, unified **Master.ahk** script that will run at system startup.

This also aids in reducing the task bar icons to a single icon as opposed to multiple icons for each individual script, given that each of the scripts utilizes the `#NoTrayIcon` top-level configuration.

*Source: [Scripts/Master.ahk at main · jimbrig/Scripts](https://github.com/jimbrig/Scripts/blob/main/AutoHotKey/Master.ahk)*

```autohotkey
#NoEnv
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; Global Shortcuts for Programs
Run, "Global-Shortcuts\Obsidian-Global-Shortcut.ahk"
Run, "Global-Shortcuts\Todoist-Global-Shortcut.ahk"
Run, "Global-Shortcuts\Keeper-Global-Shortcut.ahk"

; Custom Scripts
Run, "Custom\Custom-Text-Expanders.ahk"
Run, "Custom\Toggle-Hidden-Files-and-Folders.ahk"

; HotKeyHelp - List and Configure AHK Scripts/Hotkeys
Run, "HotKeyHelp\HotkeyHelp.ahk"
```

***

Backlinks:
-   [[Code/AutoHotKey/README|AutoHotKey Scripts]]
-	[[HotKeyHelp AHK Script]]
-	[[Custom AHK Scripts]]
-	[[Global Shortcut AHK Scripts]]
-	[[Text Expander AHK Scripts]]
-	[[Toggle Hidden Files and Folders AHK Script]]

Related:
- [[Espanso Scripts]]