FROM node:18

# Set working directory
WORKDIR /app

# Copy package files first
COPY package*.json ./

# Install dependencies as root (temporary)
RUN npm ci --omit=dev

# Create non-root user and group
RUN groupadd -r result && useradd -r -g result appuser \
    && mkdir -p /app \
    && chown -R appuser:result /app

# Copy application code as non-root
COPY --chown=appuser:result . .


# Switch to non-root user
USER appuser

# Expose correct port
EXPOSE 8081


CMD ["node", "server.js"]
