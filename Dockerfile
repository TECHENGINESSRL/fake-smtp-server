FROM node:8

ARG SMTPPORT=25
ARG SMTPHOST="0.0.0.0"
ARG HTTPPORT=1080
ARG HTTPHOST="0.0.0.0"
ARG WORKDIR=/opt/e2esmtp

# Create app directory
WORKDIR $WORKDIR

ENV HTTPPORT $HTTPPORT
ENV SMTPHOST $SMTPHOST
ENV SMTPPORT $SMTPPORT
ENV HTTPHOST $HTTPHOST


# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
COPY . .

RUN npm run build

# RUN mv -f build $WORKDIR

EXPOSE $HTTPPORT
EXPOSE $SMTPPORT

CMD [ "node", "index.js" ]