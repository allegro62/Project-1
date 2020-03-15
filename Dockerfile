# use a node base image
FROM node:10


# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package.json ./

RUN npm install

RUN npm install express

# Bundle app source
COPY . .


  
# set maintainer
LABEL maintainer "raj.rajesh622@gmail.com"


# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1

# tell docker what port to expose
EXPOSE 8000

CMD [ "node", "main.js" ]
