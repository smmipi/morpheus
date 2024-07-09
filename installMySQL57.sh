MYSQL_ROOT_PASSWORD="<%=cypher.read('secret/mysql_root')%>"

apt-get remove apparmor -y
apt-get install gnupg2 -y
wget https://repo.percona.com/apt/percona-release_latest.$(lsb_release -sc)_all.deb
dpkg -i percona-release_latest.$(lsb_release -sc)_all.deb
apt-get update -y

DEBIAN_FRONTEND=noninteractive

echo "percona-server-server-5.7 percona-server-server-5.7/root-pass password $MYSQL_ROOT_PASSWORD" | debconf-set-selections
echo "percona-server-server-5.7 percona-server-server-5.7/re-root-pass password $MYSQL_ROOT_PASSWORD" | debconf-set-selections

apt install -y percona-server-server-5.7
