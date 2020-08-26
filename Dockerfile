From node as build

Maintainer  Canarypwn@GeekPie_Association

WORKDIR /Frontend

COPY /my-app  /Frontend

RUN yarn
RUN yarn build

CMD nginx -g "daemon off;"

FROM nginx:stable-alpine

COPY --from=build /Frontend /dist
COPY nginx.conf /etc/nginx/
