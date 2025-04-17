# How to set commit message by default

**This approach is not suited for team development. You can do it for your personal private projects.**

Create a template file at `./git/COMMIT_TEMPLATE` that looks like this:

```txt:./git/COMMIT_TEMPLATE
*
```

Run the following command:

```sh
git config commit.template ./.git/COMMIT_TEMPLATE
```

<https://stackoverflow.com/questions/21998728/how-to-specify-a-git-commit-message-template-for-a-repository-in-a-file-at-a-rel>
