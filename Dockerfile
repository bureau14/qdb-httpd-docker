FROM       ubuntu:latest

# User configurable: define versions we are using
ENV        QDB_URL         https://download.quasardb.net/quasardb/2.0/2.0.0rc3/web-bridge/qdb-2.0.0-linux-64bit-web-bridge.tar.gz

#############################
# NO EDITING BELOW THIS LINE
#############################

# Download and install
RUN        apt-get install -y wget
RUN        wget -qO- $QDB_URL | tar xvz -C /usr
RUN        mkdir -p /usr/share/qdb/ && mv /usr/bin/html /usr/share/qdb/www

ADD        qdb-httpd-docker-wrapper.sh /usr/bin/

# Always launch qdb process
ENTRYPOINT ["/usr/bin/qdb-httpd-docker-wrapper.sh"]

# Expose the port qdb-httpd is listening at
EXPOSE     8080
