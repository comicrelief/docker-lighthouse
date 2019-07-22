FROM node:10.16.0-jessie

# Install necessary dependencies to get lighthouse working.
RUN apt-get update && apt-get install -y --force-yes \
    apt-transport-https \
    ca-certificates \
    build-essential \
    curl \
    gnupg \
    awscli \
    --no-install-recommends \
  && curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
  && apt-get update && apt-get install -y --force-yes \
    google-chrome-stable \
    --no-install-recommends \

ARG CACHEBUST=1
RUN yarn global add lighthouse
