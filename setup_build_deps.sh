# Set up dependencies

curl -fsSL https://deb.nodesource.com/setup_18.x | bash - &&\
apt-get install -y nodejs

apt install golang-go
mkdir ~/go

git clone https://github.com/magefile/mage
cd mage
go run bootstrap.go
