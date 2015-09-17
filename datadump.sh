#!/bin/bash

echo "Enter database root password: "
read -s dbpass

mysqldump -u root -p$dbpass --databases `mysql -u root -p$dbpass --skip-column-names \
   -e "SELECT GROUP_CONCAT(schema_name SEPARATOR ' ') \
   FROM information_schema.schemata WHERE schema_name \
   NOT IN ('mysql','performance_schema','information_schema');"`
