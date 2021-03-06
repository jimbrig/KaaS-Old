---
Date: 2021-10-28
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Alias: Espanso Scripts
---

#Type/Vault/Readme

# Espanso Scripts

[TOC]

[Espanso](https://espanso.org/) is an Open Source text-expander tool.

Links:

- [Espanso Website](https://espanso.org/) 
- [EspansoHub](https://hub.espanso.org/) 
- [Documentation](https://espanso.org/docs/get-started/)
- [Reddit Community](https://www.reddit.com/r/espanso/)
- [GitHub](https://github.com/federico-terzi/espanso)

## Setup

### Installation

```powershell
sudo cinst -y espanso
```

Espanso should launch at startup, but to check run `espanso status`, and if it say "espanso is not running" then run `espanso start`.

### Configuration

espanso uses a file-based configuration approach, following the Unix philosophy. All configuration files reside in the espanso directory, whose location depends on the current OS:

- Linux: $XDG_CONFIG_HOME/espanso (e.g. /home/user/.config/espanso)
- macOS: $HOME/Library/Preferences/espanso (e.g. /Users/user/Library/Preferences/espanso)
- Windows: {FOLDERID_RoamingAppData}\espanso (e.g. C:\Users\user\AppData\Roaming\espanso)

A quick way to find the path of your configuration folder is by using the following command:

```powershell
espanso path
```

Following from above, espanso scripts should be located at `%APPDATA%\espanso` with a file named `default.yml` and (optional) a sub-directory named `user` (i.e. `%APPDATA%\espanso\user`):

```powershell
> ~\AppData\Roaming\espanso :: git(main) 10:43:57
➜ wsl -e tree
.
├── README.md
├── default.yml
└── user
    ├── dev.yml
    ├── emails.yml
    ├── passwords.yml
    ├── phone-numbers.yml
    └── websites.yml

1 directory, 7 files
```

## Editing

For quick editing of espanso scripts run `espanso edit`.

## Application Specific

Use the `filter_title` configuration variable to specify expansions that should only apply in windows with a title of the provided value. For example, to only match and trigger the below expansion in Outlook you would use:

```yaml
filter_title: "Outlook"
matches:
    - trigger: ":signature"
      replace: "Jimmy Briggs"
```

The following table lays out all possible `filter_*` configurations:

| Filter | Description | Windows Support | MacOS Support | Linux Support |
| --- | --- | --- | --- | --- |
| `filter_title` | Filter based on the current Window title | Full support | Uses the App identifier instead of the Window title | Full support |
| `filter_exec` | Filter based on the current application executable path | Full support | Full support | Partial support |
| `filter_class` | Filter based on the current Window class | Uses the application executable path instead | Uses the App identifier instead | Full support |

## Ideas

- Current IP Address
- Time Codes for Work
- Emoji's
- Email Templates


```dataview
list from "Code/Espanso" AND -#Type/Vault/Readme
```

