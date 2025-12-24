# Git Configuration Fix

## Problem
You're experiencing this error when trying to commit:
```
error: gpg failed to sign the data:
fatal: failed to write commit object
403 | Author is invalid
```

## Solution

This issue occurs because:
1. GPG commit signing is enabled but failing
2. Your Git user email may not be properly configured

## Automatic Fix (Recommended)

The Codespace will automatically run the fix script on startup. If it didn't work, run it manually:

```bash
bash fix-git-config.sh
```

## Manual Fix

If you prefer to configure manually, run these commands in your terminal:

```bash
# Set your GitHub username
git config --global user.name "GuestFreak-eng"

# Set your GitHub no-reply email
git config --global user.email "244913075+GuestFreak-eng@users.noreply.github.com"

# Disable GPG signing (which was causing the error)
git config --global commit.gpgsign false
git config --global tag.gpgsign false
```

## Verify the Fix

Check your Git configuration:

```bash
git config --global --list | grep user
git config --global --list | grep gpgsign
```

You should see:
- `user.name=GuestFreak-eng`
- `user.email=244913075+GuestFreak-eng@users.noreply.github.com`
- `commit.gpgsign=false`

## Using a Different Email

If you want to use a different email address:

1. Go to [GitHub Email Settings](https://github.com/settings/emails)
2. Add and verify your email address
3. Use that verified email instead:
   ```bash
   git config --global user.email "your-verified-email@example.com"
   ```

## Why This Works

GitHub requires commits to have:
- A valid author name
- An email address associated with your GitHub account
- Either no GPG signing, or properly configured GPG keys

The no-reply email (`244913075+GuestFreak-eng@users.noreply.github.com`) is automatically associated with your GitHub account and doesn't expose your personal email.

## Permanent Fix

The `devcontainer.json` has been updated with a `postStartCommand` that runs the fix script automatically every time the Codespace starts, ensuring this configuration persists.
