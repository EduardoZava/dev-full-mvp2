# version 1.0.0
FROM node:lts-alpine
COPY ./ /dev-full-mvp2
WORKDIR /dev-full-mvp2
RUN cd dev-full-mvp2/app-back
RUN npm i package.json
CMD ["npm", "start"]
