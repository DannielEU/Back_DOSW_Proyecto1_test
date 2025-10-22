FROM node:22-alphine
WORKDIR /app
COPY package*.json ./
RUN npm ci
RUN npm run build
COPY . .
EXPOSE 3000
CMD ["node","dist/main"]