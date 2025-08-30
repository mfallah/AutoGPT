# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install needed packages directly
RUN pip install --no-cache-dir openai python-dotenv chromadb tiktoken requests beautifulsoup4

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variables
ENV PYTHONPATH=/app

# Run the application
CMD ["python", "-m", "autogpt"]
