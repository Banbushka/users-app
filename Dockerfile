FROM node:17-alpine

WORKDIR /app

# Copy client and server code
COPY ./client ./client
COPY ./server ./server

# Install dependencies for server
RUN cd server &&  npm install & cd ..

# Install dependencies for client
RUN cd client && npm install

# Variable prueba
ENV  DB_URL_ATLAS=

# Expose ports
EXPOSE 3000
EXPOSE 5173

# Start client and server apps
CMD ["sh", "-c", "cd server && npm install && npm start & cd client && npm run dev -- --port 5173 --host 0.0.0.0"]