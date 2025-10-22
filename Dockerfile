FROM node:20-alpine

WORKDIR /app

# Copia los archivos de dependencias
COPY package*.json ./

# Instala todas las dependencias (incluidas las de desarrollo)
# porque necesitamos @nestjs/cli para construir
RUN npm ci

# Instala el CLI de Nest globalmente (alternativo a usarlo desde node_modules)
RUN npm install -g @nestjs/cli

# Copia el resto del código fuente
COPY . .

# Compila el proyecto NestJS
RUN npm run build

# Expone el puerto 3000
EXPOSE 3000

# Comando por defecto
CMD ["node", "dist/main"]
