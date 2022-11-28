#!/bin/sh -l
set -e

APPLICATION_ID=$1
API_KEY=$2
FILE=$3

# build from the main source repository
git clone https://github.com/vtexdocs/docsearch-scraper.git

cd docsearch-scraper/

# install pipenv
pip3 install pipenv==2018.11.26


# create the .env file for docsearch
echo "APPLICATION_ID=${APPLICATION_ID}
API_KEY=${API_KEY}
CHROMEDRIVER_PATH=/usr/bin/chromedriver
" > .env

PIPENV_VENV_IN_PROJECT=true pipenv install

echo "Update webclient.py"
cp ./utils/webclient.py ./.venv/lib/python3.6/site-packages/scrapy/core/downloader/

pipenv run ./docsearch run $FILE

echo "🚀 Successfully indexed and uploaded the results to Algolia"