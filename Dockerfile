FROM       ubuntu:latest

# User configurable: define versions we are using
ENV        QDB_VERSION 2.0.0
ENV        QDB_DEB_VERSION 1

#############################
# NO EDITING BELOW THIS LINE
#############################

# Upload and install the deb package
ADD        qdb-server_${QDB_VERSION}-${QDB_DEB_VERSION}.deb .
ADD        qdb-httpd-docker-wrapper.sh /usr/sbin/

RUN        dpkg -i qdb-server_${QDB_VERSION}-${QDB_DEB_VERSION}.deb

# Always launch qdb process
ENTRYPOINT ["/usr/sbin/qdb-httpd-docker-wrapper.sh"]

# Expose the port qdb-httpd is listening at
EXPOSE     8080
