FROM node:16 as vsf-pre
ARG TAG_BRANCH=main

WORKDIR /app

RUN apt-get install -y --no-install-recommends git \
  && git clone --depth=1 --branch ${TAG_BRANCH} https://github.com/vuestorefront-community/template-odoo.git . \
  && yarn add wait-on \
  && yarn install 


RUN yarn build

FROM node:16 as vsf2

WORKDIR /app

COPY --from=vsf-pre /app  .

VOLUME ["/apt/.nuxt"]

ENV HOST 0.0.0.0


CMD [ "yarn", "dev" ]
