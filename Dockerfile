FROM python:3.6

RUN apt-get update -y && apt-get install -yq \
    software-properties-common
RUN add-apt-repository -y ppa:openjdk-r/ppa
RUN apt-get update -y && apt-get install -yq \
  unzip \
  xvfb \
  libxi6 \
  libgconf-2-4 \
  default-jdk

# https://www.ubuntuupdates.org/package/google_chrome/stable/main/base/google-chrome-stable for references around the latest versions
RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add
RUN echo "deb [arch=amd64]  http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
RUN apt-get update -y && apt-get install -yq \
  google-chrome-stable=106.0.5249.119-1 \
  unzip
# RUN wget -q https://chromedriver.storage.googleapis.com/91.0.4472.101/chromedriver_linux64.zip
# RUN wget -q https://chromedriver.storage.googleapis.com/100.0.4896.20/chromedriver_linux64.zip
RUN wget -q https://chromedriver.storage.googleapis.com/106.0.5249.61/chromedriver_linux64.zip

RUN unzip chromedriver_linux64.zip

RUN mv chromedriver /usr/bin/chromedriver
RUN chown root:root /usr/bin/chromedriver
RUN chmod +x /usr/bin/chromedriver

RUN wget -q https://selenium-release.storage.googleapis.com/3.13/selenium-server-standalone-3.13.0.jar
RUN wget -q http://www.java2s.com/Code/JarDownload/testng/testng-6.8.7.jar.zip
RUN unzip testng-6.8.7.jar.zip


COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]