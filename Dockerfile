# Build phase
FROM node:alpine as builder_stage
WORKDIR /usr/app
COPY ./package.json ./
RUN npm install
COPY . .
RUN npm run build

#Feed Build folder to nginx
FROM nginx
EXPOSE 80
COPY --from=builder_stage /usr/app/build /usr/share/nginx/html