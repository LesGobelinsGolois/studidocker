#telechargement de l'image node dans "build" pour pouvoir l'installer
FROM node:18.10.0-alpine as build

#mkdir && cd /app
WORKDIR /app

#copie du package json dans le /app
COPY package.json .

#recuperation de yarn et dépendances
RUN npm i -g yarn@1.22.22
RUN yarn install

#copier le reste du code
COPY . .

#construction de l'application
RUN yarn run build
