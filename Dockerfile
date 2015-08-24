FROM ubuntu:14.04
RUN sudo apt-get -y update && \
  # PHP CLI environment.
  sudo apt-get -y install  && \
  # PHP extensions.
  sudo apt-get -y install php5-curl && sudo php5enmod curl && \
  sudo apt-get -y install php5-mcrypt && sudo php5enmod mcrypt && \
  sudo apt-get -y install php5-readline && sudo php5enmod readline && \
  # Utilities
  sudo apt-get -y install curl

RUN curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

ADD php.ini /etc/php5/fpm/php.ini
ADD php-cli.ini /etc/php5/cli/php.ini
ADD entrypoint.sh /entrypoint.sh

RUN chmod u+x /entrypoint.sh

ENTRYPOINT /entrypoint.sh
