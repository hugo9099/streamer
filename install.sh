sudo apt-get install -y build-essential libpcre3 libpcre3-dev libssl-dev
wget http://nginx.org/download/nginx-1.13.1.tar.gz
wget https://github.com/arut/nginx-rtmp-module/archive/master.zip
tar -zxvf nginx-1.13.1.tar.gz
sudo apt-get install -y unzip
unzip master.zip
cd nginx-1.13.1
./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-master
make
sudo make install
sudo echo "rtmp {
        server {
                listen 1935;
                chunk_size 4096;

                application live {
                        live on;
                        record off;
                }
        }
}" >> /usr/local/nginx/conf/nginx.conf

sudo /usr/local/nginx/sbin/nginx -s stop
sudo /usr/local/nginx/sbin/nginx

