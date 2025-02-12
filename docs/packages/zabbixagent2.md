﻿# <img src="https://cdn.jsdelivr.net/gh/mkevenaar/chocolatey-packages@4e93c2fd8e5a8ff008b3d76f77ad9ae7114a6749/icons/zabbix-agent2.png" width="32" height="32"/> [![Zabbix Agent 2](https://img.shields.io/chocolatey/v/zabbix-agent2.svg?label=Zabbix+Agent+2)](https://community.chocolatey.org/packages/zabbix-agent2) [![Zabbix Agent 2](https://img.shields.io/chocolatey/dt/zabbix-agent2.svg)](https://community.chocolatey.org/packages/zabbix-agent2)

## Usage

To install Zabbix Agent 2, run the following command from the command line or from PowerShell:

```powershell
choco install zabbix-agent2
```

To upgrade Zabbix Agent 2, run the following command from the command line or from PowerShell:

```powershell
choco upgrade zabbix-agent2
```

To uninstall Zabbix Agent 2, run the following command from the command line or from PowerShell:

```powershell
choco uninstall zabbix-agent2
```

## Description

This package installs the Zabbix agent MSI from the [pre-compiled files](https://www.zabbix.com/download_agents) supplied by [Zabbix LLC](https://www.zabbix.com/). The source code for this Chocolatey package can be found on [GitHub](https://github.com/zabbix/zabbix-agent-chocolatey). Please file any issues you find in the project's [Issue tracker](https://github.com/zabbix/zabbix-agent-chocolatey/issues).

## Package installation defaults

By default, **installation** of this package:

* Will install the OpenSSL version of the Zabbix agent to "%ProgramFiles%\Zabbix Agent".
* Will set the hostname to $env:COMPUTERNAME.
* Will set the server to 127.0.0.1.
* Will add firewall rules.
* Will *NOT* enable encryption.
* Will *NOT* enable remote commands.

**Please Note**: To have choco remember parameters on upgrade, be sure to set:

```powershell
choco feature enable -n=useRememberedArgumentsForUpgrades`
```

## Package Parameters

A full list of configuration options is available in the [Zabbix documentation](https://www.zabbix.com/documentation/current/en/manual/installation/install_from_packages/win_msi#command-line-based-installation).
Here are some of the most commonly used:

* `SERVER` - List of comma delimited IP addresses (127.0.0.1).
* `SERVERACTIVE` - IP:port (or hostname:port) of Zabbix server or Zabbix proxy for active checks ($SERVER).
* `HOSTNAME` - Unique, case sensitive hostname ($env:COMPUTERNAME)
* `INSTALLFOLDER` - Full pathname specifying where the Zabbix agent should be installed (%ProgramFiles%\Zabbix Agent).
* `ENABLEPATH` - Add Zabbix agent to the PATH environment variable (0).
* `SKIP` - Passing "fw" to this parameter will skip adding the firewall exception rule.
* `ALLOWDENYKEY` - Sequence of "AllowKey" and "DenyKey" parameters separated by ;. Use \\; to escape the delimiter.

These parameters can be passed to the installer with the use of `--params`.

### Examples

`choco install zabbix-agent2 --params '"/SERVER:<Zabbix Server IP>`
`choco install zabbix-agent2 --params '"/SERVER:192.168.6.76 /SERVERACTIVE:192.168.6.76 /HOSTNAME:zabbix-agent-1.zabbix.com /ALLOWDENYKEY:AllowKey=system.run[*] /SKIP:fw"'`

**Please Note**: This is an automatically updated package. If you find it is
out of date by more than a day or two, please contact the maintainer(s) and
let them know the package is no longer updating correctly.


## Links

[Chocolatey Package Page](https://community.chocolatey.org/packages/zabbix-agent2)

[Software Site](https://www.zabbix.com/)

[Package Source](https://github.com/mkevenaar/chocolatey-packages/tree/master/automatic/zabbix-agent2)

