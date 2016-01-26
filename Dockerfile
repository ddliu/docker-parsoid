FROM node:4
RUN mkdir -p /usr/var/app
WORKDIR /usr/var/app
RUN echo {} > package.json && npm install --save parsoid@0.4.0
ADD localsettings.js /usr/var/app/node_modules/parsoid/api/

ENV PORT 8000
ENV MW_URL http://localhost

EXPOSE ${PORT}
ENTRYPOINT node ./node_modules/parsoid/api/server
