# Use an official lightweight Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy application source
COPY . .

# Make sure logs are shown immediately
ENV PYTHONUNBUFFERED=1

# Expose Flask default port
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
