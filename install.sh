#!/bin/bash
set -e
source /build/buildconfig
set -x
# some part of this script was taken from https://github.com/dweinstein/dockerfile-androguard/blob/master/Dockerfile

apt-get update

$minimal_apt_get_install mercurial git python2.7 \
      python-setuptools g++ curl wget zip unzip  python-dev libbz2-dev \
      libmuparser-dev libsparsehash-dev python-ptrace python-pygments \
      python-pydot liblzma-dev libsnappy-dev python-pip python-setuptools \
      libc6 libc6-dev

pip install simhash elfesteem requests yara ipython \
      http://sourceforge.net/projects/pyfuzzy/files/latest/download\?source\=files#pyfuzzy-0.1.0 \
      git+git://github.com/ahupp/python-magic

mkdir -p /tmp/chilkat && \
	wget -qO- http://www.chilkatsoft.com/download/9.5.0.46/chilkat-9.5.0-python-2.7-x86_64-linux.tar.gz \
    | tar xfvz - -C /tmp/chilkat/ && \
    find /tmp/chilkat -type f -exec mv -i "{}" /usr/lib/python2.7/ \; && \
    rm -rf /tmp/chilkat

cd /home/app/
curl -sSL https://github.com/androguard/androguard/archive/master.tar.gz | tar xz \
	&& mv ./androguard-master ./androguard
cd /home/app/androguard



# Compile the py files into pyc in order to speed-up start
python -m compileall /home/app/andorguard
chown -R app /home/app/androguard

# clean
apt-get remove -y libbz2-dev liblzma-dev libmuparser-dev libsnappy-dev libsparsehash-dev python-dev zlib1g-dev build-essential  g++
apt-get -y autoremove

rm -rf /tmp/pip-build-root
/build/finalize.sh
