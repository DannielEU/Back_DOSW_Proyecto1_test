FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci
RUN npm install --save-dev @nestjs/cli
RUN npm run build
COPY . .
EXPOSE 3000
CMD ["node","dist/main"]