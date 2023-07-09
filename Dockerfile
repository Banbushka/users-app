FROM node:14-alpine

WORKDIR /app

# Install dependencies for server
COPY ./server/package*.json ./server/
RUN cd server && npm install

# Install dependencies for client
COPY ./client/package*.json ./client/
RUN cd client && npm install

# Copy client and server code
COPY ./client ./client
COPY ./server ./server

# Expose ports
EXPOSE 3000
EXPOSE 5173

# Start client and server apps
CMD ["sh", "-c", "cd server && npm start & while ! nc -z localhost 3000; do sleep 1; done && cd client && npm run dev -- --port 5173 --host 0.0.0.0"]