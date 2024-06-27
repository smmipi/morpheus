MYSQL_ROOT_PASSWORD="<%=cypher.read('secret/mysql_root')%>"

apt-get remove apparmor -y
apt-get install gnupg2 -y
wget https://repo.percona.com/apt/percona-release_latest.$(lsb_release -sc)_all.deb
dpkg -i percona-release_latest.$(lsb_release -sc)_all.deb
apt-get update -y
percona-release setup ps80
DEBIAN_FRONTEND=noninteractive

echo "percona-server-server percona-server-server/root-pass password $MYSQL_ROOT_PASSWORD" | debconf-set-selections
echo "percona-server-server percona-server-server/re-root-pass password $MYSQL_ROOT_PASSWORD" | debconf-set-selections
echo "percona-server-server percona-server-server/default-auth-override	select	Use Strong Password Encryption (RECOMMENDED)" | debconf-set-selections

apt-get install percona-server-server -y

