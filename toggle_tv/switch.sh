#!/bin/bash
: '
Use [MultiMonitorTool](https://www.nirsoft.net/utils/multi_monitor_tool.html) with streamdeck to enable/disable
a display by loading different configs.
Arguments: enable/disable
Issues:
- WSL doesnt read update path when starting from streamdeck or powershell so need to
hardcode path to multimonitortool.
- Cant get multimonitortool to read config with a path so we need to cd to config folder first.
'
#Get script execution dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR && /c/Program\ Files/milti\ monitor\ tool/MultiMonitorTool.exe /LoadConfig "monitor_layout_$1_tv.cfg"
