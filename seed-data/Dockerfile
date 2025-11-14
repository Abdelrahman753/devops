FROM python:3.11-slim

# Install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends apache2-utils curl \
    && rm -rf /var/lib/apt/lists/*

# Create app user
RUN groupadd -r app && useradd -r -g app app

WORKDIR /seed

# Copy application code
COPY make-data.py ./make-data.py
COPY generate-votes.sh ./generate-votes.sh

# Fix Windows CRLF issue
RUN sed -i 's/\r$//' generate-votes.sh

# Generate posta / postb files
RUN python3 make-data.py

# Make script executable
RUN chmod +x generate-votes.sh

# Change ownership
RUN chown -R app:app /seed

# Switch to non-root user
USER app

CMD ["./generate-votes.sh"]
