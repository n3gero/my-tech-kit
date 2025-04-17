# First Setup

## Installation

[Git - Download Package](https://git-scm.com/downloads/win)

## Configuration

```sh
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
ssh-keygen -t ed25519 -C "your_pc_name"
```

Go to <https://github.com/settings/ssh/new> and add a new SSH key with the following settings:

- **Title**: id-yourpcname  
- **Key type**: Authentication Key  
- **Key**: Copy and paste the contents of `%USERPROFILE%\.ssh\id.pub`
