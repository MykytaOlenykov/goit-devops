#!/bin/bash

# Tested on Ubuntu 22.04

set -e

echo "=== Installing development tools ==="

# Update system
sudo apt update -y

# Install Docker
if ! command -v docker &> /dev/null
then
    echo "Docker not found. Installing..."
    sudo apt install -y docker.io
    sudo systemctl enable docker
    sudo systemctl start docker
else
    echo "Docker is already installed."
fi

# Install Docker Compose
if ! command -v docker-compose &> /dev/null
then
    echo "Docker Compose not found. Installing..."
    sudo apt install -y docker-compose
else
    echo "Docker Compose is already installed."
fi

# Install Python 3.9+
if ! command -v python3 &> /dev/null
then
    echo "Python3 not found. Installing..."
    sudo apt install -y python3 python3-pip
else
    PYTHON_VERSION=$(python3 -V 2>&1 | awk '{print $2}')
    REQUIRED_VERSION="3.9"
    if [ "$(printf '%s\n' "$REQUIRED_VERSION" "$PYTHON_VERSION" | sort -V | head -n1)" = "$REQUIRED_VERSION" ]; then
        echo "Python $PYTHON_VERSION is installed (ok)."
    else
        echo "Python version is lower than 3.9. Installing Python 3.9..."
        sudo apt install -y python3.9 python3.9-venv python3.9-distutils
        sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 2
    fi
fi

# Install Django
if ! python3 -m pip show django &> /dev/null
then
    echo "Django not found. Installing..."
    sudo apt install -y python3-pip python3-venv
    python3 -m pip install --upgrade pip
    python3 -m pip install django
else
    echo "Django is already installed."
fi

echo "=== All tools installed successfully! ==="
