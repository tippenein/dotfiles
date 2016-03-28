#!/bin/sh

sudo apt-get install xsel
ssh-keygen -t rsa -b 4096 -C "brady.ouren@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
xsel --clipboard < ~/.ssh/id_rsa.pub
echo  "key copied to clipboard"
echo  "now go add it to github so we can pull some packages"
echo  "..."
echo "open up a browser to https://github.com/settings/keys"

if [$DESK -eq 1]
then firefox "https://github.com/settings/keys"
fi
