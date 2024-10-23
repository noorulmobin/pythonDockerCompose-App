# Stage 1: Define base image
FROM python:3.10-slim AS base

# Uncomment for GPU support
# FROM nvidia/cuda:12.2.0-base-ubuntu22.04 AS gpu_base

# Set environment variables for Python
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN useradd -m appuser

# Switch to the non-root user for running the app
USER appuser

# Set the working directory
WORKDIR /app

# Copy the requirements file first to leverage Docker's cache for dependencies
COPY --chown=appuser:appuser requirements.txt .

# Install Python dependencies
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# Copy the rest of the application files
COPY --chown=appuser:appuser . .

# Declare a volume for copying files
VOLUME ["/app/venu"]

# Expose the application port
EXPOSE 8000

# Define the command to run the app
CMD ["python", "app.py"]
