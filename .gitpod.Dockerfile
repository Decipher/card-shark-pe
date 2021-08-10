FROM gitpod/workspace-full

# Install Composer 2
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN sudo php composer-setup.php --install-dir /usr/bin --filename composer
RUN php -r "unlink('composer-setup.php');"

# Install Lando
RUN curl -OL https://github.com/lando/lando/releases/download/v3.1.4/lando-v3.1.4.deb && sudo dpkg -i  --ignore-depends=docker-ce,iptables lando-v3.1.4.deb && rm -rf lando-v3.1.4.deb
RUN mkdir -p ~/.lando && echo "proxy: 'ON'\nproxyHttpPort: '8080'\nproxyHttpsPort: '4443'\nbindAddress: '0.0.0.0'\nproxyBindAddress: '0.0.0.0'" > ~/.lando/config.yml
