#!/bin/bash

update_and_push() {
  current_timestamp=$(date "+%Y-%m-%d %H:%M:%S")
  echo "Run sync task at $current_timestamp" 

  # Update the last_updated field in _config.yml
  awk -v date="$current_timestamp" '
    /^last_updated:/ {$0="last_updated: \"" date "\""}
    {print}
  ' _config.yml > _config.yml.tmp && mv _config.yml.tmp _config.yml

  # Prefer remote changes
  git fetch origin main
  git reset --hard origin/main

  # Update the timestamp
  git add _config.yml
  git commit -m "Update timestamp to $current_timestamp"
  git push origin main
}

# Run the update_and_push function every six hours indefinitely
while true; do
  update_and_push
  sleep $((6 * 60 * 60))
done
