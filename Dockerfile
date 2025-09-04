FROM node:lts-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install --omit=dev

COPY --link . ./

EXPOSE 5000
CMD ["node", "index.js"]

