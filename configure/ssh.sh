#!/bin/sh

echo "What email address would you like to attach to the SSH key?"
read email
ssh-keygen -t ed25519 -b 4096 -C "$email"
chmod 600 ~/.ssh/id_rsa ~/.ssh/id_rsa
