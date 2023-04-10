#!/bin/bash

env >> /etc/environment

nohup gunicorn keep_alive:app --bind 0.0.0.0:8080 &

python3 MRB.py --session --fast --headless --telegram "${TOKEN}" "${CHAT_ID}" ;

sh ./clean_mem.sh ;

echo "Starting Cron..."

exec "cron -f"

