#! /bin/bash
echo "Create env. Ubuntu 16"
echo "User : es912"
echo "=========================="
echo "1. pre-install tools for vatic" 
sudo apt-get update
sudo apt-get autoremove
sudo apt-get install -y git python-setuptools build-essential autoconf libtool pkg-config python-opengl python-imaging python-pyrex python-pyside.qtopengl idle-python2.7 qt4-dev-tools qt4-designer libqtgui4 libqtcore4 libqt4-xml libqt4-test libqt4-script libqt4-network libqt4-dbus python-qt4 python-qt4-gl libgle3 python-dev libavcodec-dev libavformat-dev libswscale-dev libjpeg62 libjpeg62-dev libfreetype6 libfreetype6-dev libmysqlclient-dev gfortran 
sudo apt-get install -y apache2
sudo apt-get install libapache2-mod-wsgi
sudo a2enmod wsgi 
sudo service apache2 restart
sudo apt-get install -y python-mysqldb
sudo apt-get install -y mysql-server
echo "rember set mysql passwd soc123"
sudo easy_install munkres
sudo apt-get install -y python-pip
sudo pip install --upgrade pip
sudo pip2 install --upgrade parsedatetime
sudo apt-get install -y libjpeg-dev
sudo apt-get install -y ffmpeg
sudo pip install -I pillow
sudo ln -s /usr/lib/x86 64-linux-gnu/libjpeg.so /usr/lib
sudo pip install -I pillow
sudo pip install cython==0.20
sudo pip install numpy
echo "=========================="
echo "2. download vatic doc."
mkdir vatic-tool
cd vatic-tool
git clone https://github.com/cvondrick/turkic.git
git clone https://github.com/cvondrick/pyvision.git
git clone https://github.com/cvondrick/vatic.git

cd turkic
sudo python setup.py install
cd ..

cd pyvision
sudo python setup.py install
cd ..
echo "=========================="
echo "3. apache setup"
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.backup
sudo chmod 666 /etc/apache2/sites-available/000-default.conf
#sudo gedit /etc/apache2/sites-enabled/000-default.conf
sudo cat ~/default.txt > /etc/apache2/sites-available/000-default.conf
sudo cp /etc/apache2/mods-available/headers.load /etc/apache2/mods-enabled
sudo apache2ctl graceful
echo "ingrone error messge"
echo "=========================="
echo "4. mysql setup"
echo "passwd soc123"
echo "create database vatic;"
echo "quit;"
mysql -u root -p
echo "=========================="
echo "5. vatic setup"
cd ~/vatic-tool/vatic
cp config.py-example config.py
cat ~/config.txt > config.py
chmod 777 server.py
turkic setup --database
turkic setup --database --reset 
turkic setup --public-symlink
echo "=========================="
echo "6. check vatic server"
echo "input link to browser http://localhost/"
turkic status --verify
echo "=========================="
echo "7. prepare upload video"
mkdir ~/vatic-tool/video
mkdir ~/vatic-tool/video/output
cp ~/example.mp4 ~/vatic-tool/video/
cd ~/vatic-tool/vatic
turkic extract ~/vatic-tool/video/example.mp4 ~/vatic-tool/video/output --width 640 --height 480
turkic load identifier ~/vatic-tool/video/output/ Human --offline --length 9700
turkic publish --offline
echo "copy the address and paste to browser"
echo "Wating for uploading"
echo "=========================="
echo "8. download lablefile"
echo "If you finish lable object remeber input under instruction"
echo "cd ~/vatic-tool/vatic"
echo "turkic dump identifier -o ~/vatic-tool/video/output.txt"
