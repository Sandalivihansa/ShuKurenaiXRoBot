# Use Python 3.10.1 Slim Buster as the base image
FROM python:3.10.1-slim-buster

# Set the working directory
WORKDIR /ShuKurenaiXRoBot/

# Update and install essential packages
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y git wget curl bash neofetch ffmpeg software-properties-common python3-pip

# Copy the requirements file into the container
COPY requirements.txt .

# Install the required Python dependencies
RUN pip3 install --upgrade pip \
    && pip3 install wheel \
    && pip3 install --no-cache-dir -U -r requirements.txt

# Copy the rest of your project files into the container
COPY . .

# Set the default command to run the bot
CMD ["python3", "-m", "ShuKurenaiXRoBot"]
