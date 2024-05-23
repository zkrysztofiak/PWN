FROM node:12.18.3

RUN sed -i s/deb.debian.org/archive.debian.org/g /etc/apt/sources.list
RUN sed -i s/security.debian.org/archive.debian.org/g /etc/apt/sources.list
RUN sed -i s/stretch-updates/stretch/g /etc/apt/sources.list

RUN apt-get update -y && \
    apt-get install -y python make g++ tzdata

WORKDIR /code

COPY package.json .
COPY yarn.lock .

RUN npm set registry http://51.83.226.197:4873/

RUN yarn

COPY . .

RUN yarn run build

EXPOSE 3000

CMD [ "yarn", "run", "watch" ]