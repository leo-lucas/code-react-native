FROM codercom/code-server
MAINTAINER Leonardo Lucas dos Santos leonardo.santos@meta.com.br

ENV ANDROID_HOME=~/Android/Sdk
ENV ANDROID_SDK_HOME=${ANDROID_HOME}
ENV PATH=${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:/opt/buck/bin/:${PATH}

RUN code-server --install-extension andys8.jest-snippets \
	&& code-server --install-extension christian-kohler.npm-intellisense \
	&& code-server --install-extension donjayamanne.githistory \
	&& code-server --install-extension dracula-theme.theme-dracula \
	&& code-server --install-extension dsznajder.es7-react-js-snippets \
	&& code-server --install-extension eamodio.gitlens \
	&& code-server --install-extension eg2.vscode-npm-script \
	&& code-server --install-extension esbenp.prettier-vscode \
	&& code-server --install-extension Gruntfuggly.todo-tree \
	&& code-server --install-extension infeng.vscode-react-typescript \
	&& code-server --install-extension jpoissonnier.vscode-styled-components \
	&& code-server --install-extension MariusAlchimavicius.json-to-ts \
	&& code-server --install-extension mikestead.dotenv \
	&& code-server --install-extension ms-vscode.atom-keybindings \
	&& code-server --install-extension msjsdiag.debugger-for-chrome \
	&& code-server --install-extension naumovs.color-highlight \
	&& code-server --install-extension PKief.material-icon-theme \
	&& code-server --install-extension ryanluker.vscode-coverage-gutters \
	&& code-server --install-extension SonarSource.sonarlint-vscode \
	&& code-server --install-extension streetsidesoftware.code-spell-checker \
	&& code-server --install-extension walter-ribeiro.full-react-snippets \
	&& code-server --install-extension wayou.vscode-todo-highlight \
	&& code-server --install-extension yzhang.markdown-all-in-one \
	&& code-server --install-extension Zignd.html-css-class-completion

RUN  sudo apt update
# install node
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
RUN sudo apt install nodejs -y
# install java
RUN sudo apt install openjdk-8-jdk -y
RUN sudo update-alternatives --config java
# install unzip
RUN sudo apt install unzip -y
# install Android tools
RUN cd ~ && mkdir Android
RUN cd ~/Android && mkdir Sdk
RUN cd ~/Android/Sdk \
	&& wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip \
	&& wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip \
	&& unzip platform-tools-latest-linux.zip \
	&& unzip sdk-tools-linux-4333796.zip
RUN yes | ~/Android/Sdk/tools/bin/sdkmanager "platform-tools" "platforms;android-27" "build-tools;27.0.3"
# env bash
RUN echo export ANDROID_HOME=~/Android/Sdk >> ~/.bashrc
RUN echo export PATH=${PATH} >> ~/.bashrc




