FROM python:3.13-slim

# Install system packages
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    vim \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    ca-certificates \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Copy your app code
COPY . /workspace

# Install Python dependencies (optional)
RUN pip install -r requirements.txt

# Set PYTHONPATH to include the root of your code
ENV PYTHONPATH="/workspace"

# Default command
CMD ["bash"]
