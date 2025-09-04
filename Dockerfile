FROM node:lts-alpine

WORKDIR /app

COPY package*.json ./
RUN npm ci --only=production

COPY --link . ./

EXPOSE 5000
CMD ["node", "index.js"]
