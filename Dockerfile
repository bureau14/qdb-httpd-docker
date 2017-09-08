FROM       ubuntu:latest

# User configurable: define versions we are using
ENV        QDB_VERSION     2.1.0
ENV        QDB_DEB_VERSION 1
ENV        QDB_URL         http://download.quasardb.net/quasardb/2.1/2.1.0-beta.2/web-bridge/qdb-web-bridge_2.1.0-1.deb

#############################
# NO EDITING BELOW THIS LINE
#############################

# Download install the deb package
RUN        apt-get install -y wget
RUN        wget ${QDB_URL}
RUN        ln -s -f /bin/true /usr/bin/chfn
RUN        dpkg -i qdb-web-bridge_2.1.0-1.deb

ADD        qdb-httpd-docker-wrapper.sh /usr/sbin/

# Always launch qdb process
ENTRYPOINT ["/usr/sbin/qdb-httpd-docker-wrapper.sh"]

# Expose the port qdb-httpd is listening at
EXPOSE     8080
