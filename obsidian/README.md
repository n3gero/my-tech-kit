# Obsidian Guides

## Windows

### Copy Data from Cloud to PC  (Initial Sync)

#### Install AWS-CLI

[Installing or updating to the latest version of the AWS CLI - AWS Command Line Interface](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

wip...

## Android

### Copy Data from Cloud to Android  (Initial Sync)

To download your existing cloud data to local storage, use FolderSync for a one-time sync. After that, Obsidian Remotely Save will handle syncing, so FolderSync is no longer needed.

#### Create Local Folder

Create a new folder where your Obsidian markdown files will be stored, for example: `storage/document/n3geros-obsidian` (you may choose any folder name).

#### Install FolderSync

Download and install the app from Google Play:

[FolderSync – Apps on Google Play](https://play.google.com/store/apps/details?id=dk.tacit.android.foldersync.lite&pcampaignid=web_share)

#### Use FolderSync to sync

FolderSync:

- Go to _Accounts_ > _Add Account_ > _S3 Compatible_
- Configure the account as follows:

| Setting           | Value                                  |
| ----------------- | -------------------------------------- |
| Account Name      | `r2-n3geros-obsidian`(任意のaccount名) |
| Account key ID    | `****************vG`                   |
| Secret access key | `****************b3`                   |
| Region            | `auto`                                 |

Set up a folderPair to sync from R2 to your local folder:

| Setting                      | Value                                                   |
| ---------------------------- | ------------------------------------------------------- |
| Sync Type                    | `To left folder`                                        |
| Left Account                 | SD CARD                                                 |
| Change folder (Left Account) | `storage/document/n3geros-obsidian` (your local folder) |
| Right Account                | SD CARD                                                 |
| Change folder (Left Account) | `r2-n3geros-obsidian` (your R2 bucket folder name)      |

Once the configuration is complete, run the sync once to download your files.
