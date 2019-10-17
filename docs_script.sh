#!/bin/bash
wget -q https://github.com/lfit-sandbox/test/archive/master.tar.gz
sleep 1

#If docs dir exists:
if [[ -d docs/ ]]; then
tar xzf master.tar.gz  \
  --one-top-level=docs_stage/  \
  --strip-components=2 \
  --wildcards 'test-master/docs/*'
else
#If docs dir doesnt exist:
tar xzf master.tar.gz \
  --wildcards 'test-master/docs/*' \
  --strip-components=1
fi

if [[ -f tox.ini ]]; then
#If tox.ini doesnt exist
tar xzf master.tar.gz \
  test-master/tox.ini \
  --strip-components=1 -O \
  > tox.ini.stage
else
tar xzf master.tar.gz \
  test-master/tox.ini \
  --strip-components=1 -O \
  > tox.ini
fi

#if .gitignore doesnt exist.
if [[ -f .gitignore ]]; then
tar xzf master.tar.gz \
  test-master/.gitignore \
  --strip-components=1 -O \
  > gitignore.stage
else
tar xzf master.tar.gz \
  test-master/.gitignore \
  --strip-components=1 -O \
  > .gitignore
fi

tar xzf master.tar.gz test-master/.readthedocs.yaml --strip-components=1 -O > .readthedocs.yaml

rm master.tar.gz
rm docs_script.sh

echo "Helper script run"

git status

echo "Any files with and directories with stage in their name need to be manually merged, as these files or directories already existed in your repo"


