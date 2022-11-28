FROM python:3.6

COPY entrypoint.sh /entrypoint.sh

RUN wget -q https://chromedriver.storage.googleapis.com/106.0.5249.61/chromedriver_linux64.zip

RUN unzip chromedriver_linux64.zip

RUN mv chromedriver /usr/bin/chromedriver
RUN chown root:root /usr/bin/chromedriver
RUN chmod +x /usr/bin/chromedriver

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]