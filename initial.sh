#!/bin/bash
touch db-content/schema-with-example.sql
cat cms-database/database_content/current_database.sql > db-content/schema-with-example.sql
echo "************* Configuration for the Database **************"
echo -n "Enter user name and press [ENTER]: "
read name
if [ ${#name} -lt 3 ]; then
    echo "Error: Name is too short"
    exit 0
fi
echo -n "Enter user password and press [ENTER]: "
read -s password
printf "\n"
if [ ${#password} -lt 5 ]; then
    echo "Error: Password is shorter than 5 digits"
    exit 0
fi
echo -n "(Optional) Enter user email and press [ENTER]: "
read emailaddress
if [ -z "$emailaddress" ]; then
    emailaddress=""
fi

saltvalue=$(date +%s | sha256sum | awk '{ print $1; }')
usertoken=$(date +%s | sha256sum | awk '{ print $1; }')

cat <<EOF >> db-content/schema-with-example.sql
START TRANSACTION;
USE \`ferienwvk_db1\`;
INSERT INTO \`WUser\` (\`ID\`, \`name\`, \`pw\`, \`salt\`, \`token\`, \`mail\`) VALUES
(0, '$name', '$password', '$saltvalue', '$usertoken', '$emailaddress');
COMMIT;
EOF

echo "build image"
docker-compose build

