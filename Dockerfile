FROM python:3.6

COPY entrypoint.sh /entrypoint.sh

RUN apt-get update -y && apt-get install -yq google-chrome-stable=106.0.5249.119-1

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]