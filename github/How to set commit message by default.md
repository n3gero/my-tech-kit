# How to set commit message by default

**This approach is not suited for team development. You can do it for your personal private projects.**

```sh
New-Item -Path "./.git/COMMIT_TEMPLATE" -ItemType File -Force
Set-Content -Path "./.git/COMMIT_TEMPLATE" -Value "*" -Encoding utf8

git config commit.template ./.git/COMMIT_TEMPLATE
```

<https://stackoverflow.com/questions/21998728/how-to-specify-a-git-commit-message-template-for-a-repository-in-a-file-at-a-rel>
