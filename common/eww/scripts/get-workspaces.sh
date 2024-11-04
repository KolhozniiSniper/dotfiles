#!/bin/sh

workspaces=$(bspc query -D -m "$1")
focused_workspace=$(bspc query -D -d)
output=""

for workspace in $workspaces; do
    windows=$(bspc query -N -d "$workspace")
    if [ "$workspace" = "$focused_workspace" ]; then
        value=●
    elif [ -n "$windows" ]; then
        value=○
    else
        value=◌
    fi
    output+="$value "
done

if [ -n "$output" ]; then
    output=${output%,}
fi

echo "[$output]"
