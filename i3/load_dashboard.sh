#!/bin/bash

# How .i3/workspace_dashboard.json was created:
# 1. Place windows
# 2. i3-save-tree --workspace dashboard > ~/.i3/workspace_dashboard.json.tmp
# 3. tail -n +2 ~/.i3/workspace_dashboard.json.tmp | fgrep -v '// splitv' | fgrep -v '// splith' | sed 's|//||g' > ~/.i3/workspace_dashboard.json

# First we append the saved layout of worspace N to workspace M
current=$(i3-msg -t get_workspaces \
    | jq '.[] | select(.focused==true).name' \
    | cut -d"\"" -f2)
[[ $current = $1 ]] || \
    i3-msg "workspace $1"
sleep 0.25
i3-msg "focus parent; focus parent; focus parent; kill; append_layout ~/.i3/workspace_dashboard.json"

# And finally we fill the containers with the programs they had
(xfce4-terminal --hide-scrollbar -e 'bash -c "cal;read"' &)
sleep 0.25
(xfce4-terminal --hide-scrollbar -e 'bash -c "clockr"' &)
sleep 0.25
(xfce4-terminal --hide-scrollbar -e 'bash -c "wttr;read"' &)
sleep 0.25
(emacsclient -c ~/Sync/notes.org &)
sleep 0.25
(xfce4-terminal --hide-scrollbar -e 'bash -c "neofetch;read"' &)
