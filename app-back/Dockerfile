# version 1.0.0
FROM node:lts-alpine
COPY ./ /dev-full-mvp2/app-back
WORKDIR /dev-full-mvp2/app-back
RUN npm i package.json
CMD ["npm", "run", "start"]

