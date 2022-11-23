FROM python:3.6

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["chmod", "+x", "/entrypoint.sh"]