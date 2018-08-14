#!/bin/sh

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
template="$parent_path/template/hub_cli.yml"

echo "Setting up HUB CLI config..."
echo "What is your Github username?"
read username

echo "What is your Github oauth token?"
read token

cat > ~/.config/hub <<EOL
github.com:
    - user: ${username}
      oauth_token: ${token}
      protocol: https
EOL
