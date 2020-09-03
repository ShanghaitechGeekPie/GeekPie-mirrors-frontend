From node as build

Maintainer  Canarypwn@GeekPie_Association

WORKDIR /Frontend

COPY /my-app  /Frontend

RUN yarn
RUN yarn build

CMD nginx -g "daemon off;"

FROM nginx:stable-alpine

COPY --from=build /Frontend/dist/dist /tmp

COPY nginx.conf /etc/nginx/
