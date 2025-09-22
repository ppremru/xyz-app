# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code into the container
COPY xyz.py .

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Define environment variable for the version
ENV APP_VERSION="1.0.0"

# Run the application
CMD ["python", "xyz.py"]
