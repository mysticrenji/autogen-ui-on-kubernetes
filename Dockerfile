# Use the official Python image as the base
FROM python:3.11-slim

# Set environment Variable
ENV APP_DIR="/app"

# Set the working directory
WORKDIR $APP_DIR

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install AutoGen Studio and its dependencies
RUN pip install --no-cache-dir autogenstudio

# Expose the desired port
EXPOSE 8080

# Command to run AutoGen Studio UI
CMD ["autogenstudio", "ui", "--port", "8080", "--appdir", "./myapp"]


