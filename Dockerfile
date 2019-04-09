FROM node:11-alpine

RUN apk add --no-cache git

ENV USER node
ENV HOME /home/$USER
WORKDIR $HOME

ENV VERSION=15.13.3 \
    GIT_VERSION=7.0.8 \
    CHANGELOG_VERSION=3.0.2 \
    EXEC_VERSION=3.3.2 \
    GITHUB_VERSION=5.2.10
RUN npm install -g semantic-release@${VERSION} @semantic-release/git@${GIT_VERSION} @semantic-release/changelog@${CHANGELOG_VERSION} @semantic-release/exec@${EXEC_VERSION} @semantic-release/github@${GITHUB_VERSION}

COPY *.patch $HOME/
RUN git apply --directory / --unsafe-paths *.patch

USER $USER

CMD ["semantic-release"]
