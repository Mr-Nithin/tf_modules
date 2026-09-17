# Project

## Git Workflow

To commit and push changes for a module/folder:

```bash
git add Folder_Name
git commit -m "Added Module/ Made Changes message"
git push origin main
git tag -a "module_Name-v0.X" -m "Message"
git push --follow-tags
```

### Referencing in the code example

git::<clone-url>[//subfolder]?ref=<branch-or-tag>

```bash

source = "git::https://github.com/Mr-Nithin/tf_modules.git//master_network?ref=master_network-v0.1"

source = "git::https://github.com/Mr-Nithin/tf_modules.git//master_eks?ref=master_eks-v0.2"
```
