# Expand the MacOS spell checker
#
# After running the script goto Setting -> Keyboard -> Spelling
#   and select "U.S. English (Library)"

cd ~/Library/Spelling
curl -o en_US.dic https://raw.githubusercontent.com/wooorm/dictionaries/main/dictionaries/en/index.dic
curl -o en_US.aff https://raw.githubusercontent.com/wooorm/dictionaries/main/dictionaries/en/index.aff
