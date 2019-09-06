#!/bin/bash
wget -q https://github.com/lfit-sandbox/test/archive/master.tar.gz
sleep 1

#git checkout origin/master -- .gitignore
#git checkout origin/master -- tox.ini

tar xzf master.tar.gz --wildcards 'test-master/docs/*' --strip-components=1
tar xzf master.tar.gz test-master/tox.ini --strip-components=1 -O > tox.ini.tmp
tar xzf master.tar.gz test-master/.gitignore --strip-components=1 -O > gitignore.tmp

diff -U 9999999 tox.ini.tmp tox.ini > tox.ini.merge
mv tox.ini.merge tox.ini
rm tox.ini.tmp

diff -U 9999999 gitignore.tmp .gitignore > gitignore.merge
mv gitignore.merge .gitignore
rm gitignore.tmp

rm master.tar.gz
