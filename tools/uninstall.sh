#!/bin/sh

GitRoot=$(git rev-parse --show-toplevel)
GitCommitMessageHookPath="$GitRoot/.git/hooks/commit-msg"
BackedUpCommitMessageHook="$GitCommitMessageHookPath.previous"

Write-Output "Uninstalling Git commit-msg hook..."

if [ -e $GitCommitMessageHookPath ]; then
    rm $GitCommitMessageHookPath

    if [ -e $BackedUpCommitMessageHook ]; then
        Write-Output "Putting back your previous commit-msg hook."
        mv $BackedUpCommitMessageHook $GitCommitMessageHookPath
    fi
else
    Write-Output "No commit-msg hook found, nothing to do."
fi

Write-Output "Done."