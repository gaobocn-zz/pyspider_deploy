##########################################
# needed by pycurl
sudo apt-get install libcurl4-openssl-dev
# needed by psycopg2
apt-get install libpq-dev
# we need Python.h
apt-get install python3-dev
#we need libxml/xmlversion.h
sudo apt-get install libxml2-dev libxslt1-dev python-lxml

##########################################
Install phantomjs

sudo apt-get install libfontconfig
sudo apt-get install libfreetype6 libfreetype6-dev
sudo apt-get install libfontconfig1 libfontconfig1-dev

cd ~
export PHANTOM_JS="phantomjs-1.9.8-linux-x86_64"
wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2
sudo tar xvjf $PHANTOM_JS.tar.bz2

sudo mv $PHANTOM_JS /usr/local/share
sudo ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin

phantomjs --version # phantomjs installed

##########################################
virtualenv --python=python3 spider_env
source spider_env/bin/activate
cd spider_env
git clone https://github.com/Matt-Zhang/PyCrawler.git
cd pyspider

(change the mysql-connector-python in requirements.txt to mysql-connector-python-rf)
pip install -r requirements.txt
python3 setup.py install # this step uses a lot of memory (at least 500M is not enough, solved by adding swap file)

pyspider --version # setup finished

##########################################
cp ../../config.json ./
# we can use config file to start one part at a time, e.g. "pyspider -c config.json processor"
pyspider -c config.json &
