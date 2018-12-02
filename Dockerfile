FROM dependabot/dependabot-core:0.1.45

# Install Ruby deps to allow remote debugging for VSCode
# (https://github.com/rubyide/vscode-ruby/wiki/1.-Debugger-Installation)
RUN gem install ruby-debug-ide -v 0.6.0 \
    && gem install debase -v 0.2.2
