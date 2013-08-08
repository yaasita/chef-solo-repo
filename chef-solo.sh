#!/bin/bash
set -e
CHEF="sudo chef-solo $1"
echo 'file_cache_path "/tmp"' > solo.rb
echo "cookbook_path [ '$(pwd)/cookbooks' ]" >> solo.rb
$CHEF -c solo.rb -j solo.json
