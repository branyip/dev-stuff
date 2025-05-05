# Helpful tools and commands 🛠
A collection of things I like to use, intended to be used as a reference for initial setup of an OSX dev machine. Includes a few (sanitized) template configuration files based off of my personal preferences.

## General Tools and Apps
- [**BetterTouchTool**](https://folivora.ai/): For setting up custom macros for your keyboard and touchpad (template config included `configs/profile.bttpreset`).
  - More info about the template config [here](#bettertouchtool-template-config)
- [**iTerm2**](https://iterm2.com/): Terminal replacement (template config included `configs/iterm2_profile.json`).
  - More info about the template config [here](#iterm2-template-config)
- [**Oh My Zsh**](https://ohmyz.sh/#install): Zsh framework for plugins and themes.
  - More info about the template `.zshrc` file [here](#zsh-template-config)
- [**Notion**](https://www.notion.so/): Wiki-style note-taking app with Markdown support and various templates.
- [**Jetbrains IDEs**](https://www.jetbrains.com/): My preferred suite of IDEs (Webstorm, Pycharm)
  - Recommended plugins: CodeGlance Pro, Dracula Theme


## CLI Tools
- [**homebrew**](https://brew.sh/): Package manager. Machines with arm64 processors may want to install brew in an x86 shell for more reliable package compatibility.
- [**jq**](https://stedolan.github.io/jq/): JSON processor
- [**httpie**](https://httpie.io/docs/cli): A user-friendly cUrl stand-in
- [**tldr**](https://tldr.sh/): man pages but prettier
- [**nvm**](https://github.com/nvm-sh/nvm): Node version manager
- [**pyenv**](https://github.com/pyenv/pyenv) Python version manager
  - [Guide by realpython](https://realpython.com/intro-to-pyenv/#installing-pyenv)

## Git Commands

```shell
# Reconciliation behaviour for divergent branches
git config pull.ff true

# Alias for one line git log
git config --global alias.olog "log --oneline"

# Alias to print upstream name for working branch
git config --global alias.ref "rev-parse --abbrev-ref HEAD@{upstream}"

# Push with upstream as working branch name
git config --global alias.upush "push $(git branch --show-current)"

# Global git ignore
git config --get core.excludesfile  # check if it exists first
mkdir -p ~/.config/git && touch ~/.config/git/ignore  # if it doesn't exist then create one in the default location
git config --global core.excludesFile '~/.gitignore'
echo ".idea/" >> ~/.config/git/ignore  # example of adding Jetbrains IDE project files to global ignore
```

### Further customization
https://blog.gitbutler.com/how-git-core-devs-configure-git/


## BetterTouchTool Template Config

**Keyboard Shortcuts**

I use these shortcuts with [QMK](https://qmk.fm/) compatible keyboards (Ex. `Fn + Q` will trigger the macro for `⌃ ⌥ ←`, which resizes the focused window to the left half of my monitor).

| Shortcut  | Action                              |
|-----------|-------------------------------------|
| `⌃ ⌥ ←`   | Resize focused window to left half  |
| `⌃ ⌥ →`   | Resize focused window to right half |
| `⌃ ⌥ ↑`   | Maximize focused window             |
| `⌃ ⌥ ⌘ ←` | Move focused window to next monitor |
| `⌃ ⌥ P`   | Capture screenshot to clipboard     |


**Trackpad Shortcuts (Only works with Apple force touch trackpads)**

| Shortcut                  | Action                              |
|---------------------------|-------------------------------------|
| Press bottom-left corner  | Resize focused window to left half  |
| Press bottom-right corner | Resize focused window to right half |
| Press top-left corner     | Maximize focused window             |
| Press top-right corner    | Capture screenshot to clipboard     |


## iTerm2 Template Config

Run this command before using this template config to use the correct root directory (requires [jq](https://stedolan.github.io/jq/)):

```shell
cat <<< $(jq ".\"Working Directory\" = \"/Users/$(whoami)\"" iterm2_profile.json) > iterm2_profile.json
```

Doesn't stray too far from the default settings, some changes include:
- [Dracula](https://draculatheme.com/) themed colors and other cosmetic settings
- Pane splitting opens the new pane in the same directory as the original pane
- 10,000 scroll-back lines
- Natural text editing (Ex. text navigation shortcuts like `⌥ ←` and `⌘ ←`)

## Zsh Template Config
- Includes a few plugins (git, syntax highlighting
- [Pure](https://github.com/sindresorhus/pure) prompt
- NVM initialization
- Pyenv initialization


## Brew
Most of these have been mentioned before
```shell
brew install awscli curl httpie jq node nvm pure pyenv 
```
