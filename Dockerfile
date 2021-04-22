FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive

# Essential tools --> unzip: linux & chrome driver, curl: download linux & chrome with trusted protocols and some updates, upgrades
RUN apt-get update && apt-get install -y \
    sudo \
    wget \
    unzip \
    curl \
    xvfb

RUN apt-get update && apt-get install -y gnupg2
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
RUN sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/earth/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN sudo apt update

# Get chrome browser (!!!!!!!!!!!!)
RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub -o /tmp/google.pub \
    && cat /tmp/google.pub | apt-key add -; rm /tmp/google.pub \
    && echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/google.list \
    && mkdir -p /usr/share/desktop-directories \
    && apt-get -y update && apt-get install -y google-chrome-stable


#ENV CHROME_DRIVER_VERSION 90.0.4430.24
#RUN mkdir -p /opt/selenium \
#    && curl http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip -o /opt/selenium/chromedriver_linux64.zip \
#	&& ls /opt/selenium/chromedriver_linux64.zip \
#    && cd /opt/selenium; unzip /opt/selenium/chromedriver_linux64.zip; rm -rf chromedriver_linux64.zip; ln -fs /opt/selenium/chromedriver /usr/local/bin/chromedriver; which chromedriver;

# get python and pip
RUN apt-get update && apt-get install -y python3 python-setuptools python3-pip

RUN python3 -m pip install robotframework
RUN python3 -m pip install robotframework-selenium2library
RUN python3 -m pip install selenium
RUN python3 -m pip install robotframework-jsonlibrary
RUN mkdir -p /usr/src/rf

COPY ./westwing/ /usr/src/rf
CMD ["robot", "-d","/usr/src/rf/TestResult", "/usr/src/rf/Tests/WishlistTest.robot"]