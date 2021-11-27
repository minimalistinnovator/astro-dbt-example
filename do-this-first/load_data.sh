#!/bin/bash

ip=`cat /etc/resolv.conf | grep -A 1 'nameserver' | tail -1 | awk '{print $2}'`

PGPASSWORD=db_owner psql -p 5432 -U db_owner -d dwh -f populate_tables.sql -h $ip
# PGPASSWORD=db_owner psql -p 5432 -U db_owner -d dwh -f dwh_tables.sql -h $ip
