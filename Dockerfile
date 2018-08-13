FROM dependabot/dependabot-core:0.1.26

# Fix rake install
RUN gem pristine rake

# Install Ruby deps to allow remote debugging for VSCode
# (https://github.com/rubyide/vscode-ruby/wiki/1.-Debugger-Installation)
RUN gem install ruby-debug-ide -v 0.6.0 \
    && gem install debase -v 0.2.2

# Install build tools needed for gpgme and nokogiri native extensions
RUN apt-get update \
    && apt-get install -y \
        texinfo \
        autoconf
