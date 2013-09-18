FROM ubuntu

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y language-pack-en
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

# All our dependencies
RUN apt-get install -y openssh-server git-core libxml2-dev curl python build-essential make gcc python-dev wget libsqlite3-dev sqlite3 pandoc libzmq-dev

RUN wget http://python-distribute.org/distribute_setup.py
RUN python distribute_setup.py

RUN wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py
RUN python get-pip.py

RUN pip install ipython[notebook]

