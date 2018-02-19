#!/bin/sh
# modified from : https://github.com/wangxian/alpine-mysql/blob/master/startup.sh

if [ -d /app/mysql/mysql ]; then
  echo "[i] MySQL directory already present, skipping creation"
else
  echo "[i] MySQL data directory not found, creating initial DBs"

  mysql_install_db --user=root > /dev/null

  MYSQL_USER=${DB_USER:-"dev"}
  MYSQL_PASSWORD=${DB_PASSWORD:-"secret"}

  echo "======================================"
  echo "Username:$MYSQL_USER"
  echo "Password:$MYSQL_PASSWORD"
  echo "======================================"

  if [ ! -d "/run/mysqld" ]; then
    mkdir -p /run/mysqld
  fi

  tfile=`mktemp`
  if [ ! -f "$tfile" ]; then
      return 1
  fi

  cat << EOF > $tfile
USE mysql;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON *.* to '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
UPDATE user SET password=PASSWORD("") WHERE user='root' AND host='localhost';
EOF

  /usr/bin/mysqld --user=root --bootstrap --verbose=1 < $tfile
  rm -f $tfile
fi

exec /usr/bin/mysqld --user=root --console