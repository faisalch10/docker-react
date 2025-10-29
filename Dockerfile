FROM node:22-alpine as builder
WORKDIR /usr/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:mainline-alpine3.22-perl
COPY --from=builder  /usr/app/build /usr/share/nginx/html