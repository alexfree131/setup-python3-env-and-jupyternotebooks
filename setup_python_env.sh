#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Update the package list
echo "Updating package list..."
sudo apt-get update

# Install Python3
echo "Installing Python3..."
sudo apt-get install -y python3

# Install Pip
echo "Installing Pip..."
sudo apt-get install -y python3-pip

# Install virtualenv package if not already installed
echo "Installing virtualenv..."
pip3 install virtualenv

# Create a directory for the project
PROJECT_DIR="python_project"
echo "Creating project directory $PROJECT_DIR..."
mkdir -p $PROJECT_DIR
cd $PROJECT_DIR

# Create and activate virtual environment
echo "Creating and activating virtual environment..."
python3 -m venv venv
source venv/bin/activate

# Install Jupyter Notebooks in the virtual environment
echo "Installing Jupyter Notebooks..."
pip install jupyter

# Create requirements.txt file
echo "Creating requirements.txt file..."
pip freeze > requirements.txt

# Create .gitignore file
echo "Creating .gitignore file..."
echo "venv/" > .gitignore

# Print completion message
echo "Setup complete! The virtual environment is activated. You can start working with Jupyter Notebooks now."

# Keep the virtual environment activated
exec "$SHELL"
