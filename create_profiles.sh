#!/bin/bash  
  
# Read the username
echo -n "Enter your username (this starts with academy_): "
read user

# Read the password, do not display it and display stars instead 
unset $password
echo -n "Enter your password (nothing will be shown while you type): "
read -s password
echo

# Read the schema to work in.
echo -n "Enter the schema to work in (this is just your firstname): "
read schema

echo "Username: $user"
echo "Password: <not shown>"
echo "Schema: $schema"
read -p "Does this look correct? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
  echo "Aborting. Re-run the script to try again."
  [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # exit the script
fi

# Write the profiles.yml file
mkdir -p /home/gitpod/.dbt/
echo "testproject:
  outputs:
    dev:
      account: yw41113.eu-west-1
      database: academy_dbt
      password: $password
      role: student
      schema: $schema
      threads: 1
      type: snowflake
      user: $user
      warehouse: COMPUTE_WH
  target: dev
audience_measurement:
  outputs:
    dev:
      account: yw41113.eu-west-1
      database: academy_dbt
      password: $password
      role: student
      schema: $schema
      threads: 1
      type: snowflake
      user: $user
      warehouse: COMPUTE_WH
  target: dev
covid:
  outputs:
    dev:
      account: yw41113.eu-west-1
      database: academy_dbt
      password: $password
      role: student
      schema: $schema
      threads: 1
      type: snowflake
      user: $user
      warehouse: COMPUTE_WH
  target: dev" > /home/gitpod/.dbt/profiles.yml

