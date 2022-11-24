#!/bin/sh -l
set -e

APPLICATION_ID=$1
API_KEY=$2
FILE=$3

# build from the main source repository
git clone https://github.com/vtexdocs/docsearch-scraper.git

cd docsearch-scraper/

# install pipenv without cache
# pip install --no-cache-dir --trusted-host pypi.python.org pipenv
pip3 install pipenv==2018.11.26

# install packages without virtualenv
pipenv install --system --deploy --ignore-pipfile

PIPENV_VENV_IN_PROJECT=true pipenv shell

ls

# create the .env file for docsearch
echo "APPLICATION_ID=${APPLICATION_ID}
API_KEY=${API_KEY}
" > .env

echo "🚀 Successfully indexed and uploaded the results to Algolia"

# run algolia docsearch
exec python docsearch run $GITHUB_WORKSPACE/$FILE