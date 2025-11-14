FROM python:3.11-slim

# Create app user (best practice)
RUN groupadd -r app && useradd -r -g app app

# Set working directory
WORKDIR /app

# Copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Switch to non-root user
USER app

# Expose Flask port
EXPOSE 8080

# Run Flask with Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app", "--workers", "2"]
