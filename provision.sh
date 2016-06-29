#
# Prevent re-configuration of all packages with debconf 
# before they are installed.
sudo rm -v /etc/apt/apt.conf.d/70debconf

#
# PostgreSQL
#
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

#
# Golang
#
sudo add-apt-repository ppa:ubuntu-lxc/lxd-stable


#
# apt packages
#
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install curl \
    golang \
    postgresql-9.4 \
    libpq-dev \
    git-core \
    make \
    htop \
    nginx -y

#
# Node & npm
#
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs
sudo apt-get autoremove


#
# Go deps
#

# sudo su -c "psql -c \"create database ease;\"" postgres
# sudo su -c "psql -c \"create role ease;\"" postgres
# sudo su -c "psql -c \"alter role ease superuser;\"" postgres
# sudo su -c "psql -c \"grant all on database ease to ease;\"" postgres
# sudo su -c "psql -c \"alter role ease with login;\"" postgres
# sudo su -c "psql -c \"alter role ease with password 'ease';\"" postgres

EASE_PROFILE="/etc/profile.d/ease-env.sh"
EASE_HOME="/home/vagrant/ease"
GOCODE="/home/vagrant/gocode"

mkdir -p $GOCODE
export GOPATH=$GOCODE
go get github.com/jinzhu/gorm
go get github.com/revel/revel
go get github.com/revel/cmd/revel

#
# Environment variables
#
sudo tee $EASE_PROFILE >/dev/null << PROFILE
export EASE_HOME=$EASE_HOME
export GOPATH=$GOCODE
export PATH="\$PATH:\$GOPATH/bin"


sudo chown vagrant:vagrant $EASE_PROFILE
sudo chown -R vagrant:vagrant $GOPATH
sudo chmod 0700 $EASE_PROFILE

#
# NGINX
#
sudo tee /etc/nginx/sites-available/ease >/dev/null <<NGINX
server {
    listen 80;
    server_name localhost;
    location / {
        proxy_pass http://127.0.0.1:9000;
    }
}
NGINX

sudo rm -f /etc/nginx/sites-enabled/default
sudo ln -s /etc/nginx/sites-available/ease /etc/nginx/sites-enabled/default
sudo service nginx stop && sudo service nginx start

# Upon login, cd into the /vagrant folder automatically
line='cd /home/vagrant/gocode/src/ease/'
grep -q "$line" /home/vagrant/.bashrc || echo "$line" >> /home/vagrant/.bashrc

echo "Provisioning Complete!"