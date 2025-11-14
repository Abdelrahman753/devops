FROM node:18

# Create a non-root user
RUN groupadd -r result && useradd -r -g result appuser

# Switch to non-root user
USER appuser

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./

RUN npm install

# Copy application code
COPY . .

# Expose application port
EXPOSE 4000

# Run the Node.js application
CMD [ "node", "server.js" ]