# Install mono
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
sudo apt-get update
sudo apt-get install -qq mono-complete

# Install dependencies
sudo apt-get install -qq unzip libunwind8 gettext libssl-dev libcurl3-dev zlib1g

# Build LibUV from source
sudo apt-get install -qq make automake libtool curl
curl -sSL https://github.com/libuv/libuv/archive/v1.4.2.tar.gz | sudo tar zxf - -C /usr/local/src
cd /usr/local/src/libuv-1.4.2
sudo sh autogen.sh
sudo ./configure
sudo make
sudo make install
sudo rm -rf /usr/local/src/libuv-1.4.2 && cd ~/
sudo ldconfig

# Install/configure Nginx
sudo apt-get install -qq nginx
curl https://raw.githubusercontent.com/shirhatti/azure-template-lb-ubuntuserver/master/resources/nginx/default | sudo dd of=/etc/nginx/sites-available/default
