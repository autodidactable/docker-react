

FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#The below command will copy the resultant folder from the above process - the build folder- and copies
#it to the default folder where the nginx serves the html from. This folder information is available on nginx
#image documentation on docker-hub
COPY --from=builder /app/build /usr/share/nginx/html
