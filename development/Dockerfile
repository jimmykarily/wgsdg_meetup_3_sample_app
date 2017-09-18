FROM opensuse:latest

# Install dependencies
RUN zypper --non-interactive in curl which tar git nodejs libpq5

# Install RVM and Ruby (https://rvm.io/rvm/install)
RUN gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
# https://github.com/rvm/rvm/issues/4068#issuecomment-323384077
# RUN curl -sSL https://raw.githubusercontent.com/wayneeseguin/rvm/stable/binscripts/rvm-installer | bash -s stable --ruby=2.4.1

# https://rvm.io/support/faq#i-want-to-install-for-root-only
RUN echo 'export rvm_prefix="$HOME"' > /root/.rvmrc
RUN echo 'export rvm_path="$HOME/.rvm"' >> /root/.rvmrc
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN bash -l -c "rvm install 2.4.1"

# Install bundler gem
RUN bash -l -c "gem install bundler"

# TODO: Move this to the top of the file (with the rest of the packages)
# when your are done editing.
RUN zypper --non-interactive in postgresql-devel

WORKDIR /usr/src/app

CMD ["/bin/bash", "-l"]
ENTRYPOINT ["/bin/bash", "-l", "-c"]
