#!/bin/sh

GitRoot=$(git rev-parse --show-toplevel)
GitCommitMessageHookPath="$GitRoot/.git/hooks/commit-msg"

NewCommitMessageHookFile="/hooks/commit-msg"
NewCommitMessageHookPath="$GitRoot/tools/$NewCommitMessageHookFile"

if [ ! -e $NewCommitMessageHookPath ]; then
    Write-Output "Something's gone wrong, I can't find $NewCommitMessageHookPath"
    exit 1
fi

Write-Output "Installing Git commit-msg hook..."

if [ -e $GitCommitMessageHookPath ]; then
    BackedUpCommitMessageHook="$GitCommitMessageHookPath.previous"
    Write-Output "You already have a Git commit-msg hook installed."
    Write-Output "Backing it up as $BackedUpCommitMessageHook"
    if [ -e $BackedUpCommitMessageHook ]; then
        rm $BackedUpCommitMessageHook
    fi
    mv $GitCommitMessageHookPath $BackedUpCommitMessageHook
fi

cp $NewCommitMessageHookPath $GitCommitMessageHookPath
Write-Output "Done."
