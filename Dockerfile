FROM node:22-alpine
RUN apk add --no-cache \
    git \
    ffmpeg \
    libwebp-tools \
    python3 \
    make \
    g++
ADD https://api.github.com/repos/souravkl11/raganork-md/git/refs/heads/main version.json
RUN git clone -b main https://github.com/souravkl11/raganork-md /rgnk
WORKDIR /rgnk
RUN mkdir -p temp
ENV SESSION_ID=RGNK~Dhls7C55
RUN npm install -g --force yarn pm2
RUN yarn install
CMD ["npm", "start"]
