FROM node:18

# Set working directory
WORKDIR /app

# Copy package files first
COPY package*.json ./

# Install dependencies as root (temporary)
RUN npm ci --omit=dev

# Create non-root user and set ownership
RUN groupadd -r result && useradd -r -g result appuser \
    && chown -R appuser:result /app

# Switch to non-root user
USER appuser

# Copy application code
COPY --chown=appuser:result . .

# Expose correct port
EXPOSE 8081

# Run the Node.js application
CMD ["node", "server.js"]
