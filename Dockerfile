FROM node:16-alpine

LABEL maintainer="MageEdu <mage@magedu.com>" website="http://www.magedu.com"

LABEL version="v0.1"

ADD myserver.js /webapp/

CMD ["/usr/local/bin/node", "/webapp/myserver.js"]
