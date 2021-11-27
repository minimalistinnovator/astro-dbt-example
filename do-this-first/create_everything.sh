#!/bin/bash

# For MAC OS, maybe enable this if you're running the simple PG app;
# export PATH=/Applications/Postgres.app/Contents/Versions/9.5/bin:$PATH

ip=`cat /etc/resolv.conf | grep -A 1 'nameserver' | tail -1 | awk '{print $2}'`

echo "Removing old database and user first"
psql -f database_user.sql -U postgres -h $ip
