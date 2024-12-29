
FROM python:3.10.1-slim-buster

# Set the working directory
WORKDIR /ShuKurenaiXRoBot/

# Update and install essential packages
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y git wget curl bash neofetch ffmpeg software-properties-common \
    && apt-get install -y build-essential python3-dev libffi-dev

# Check Python and pip versions for debugging
RUN python3 --version
RUN pip3 --version

# Copy the requirements file into the container
COPY requirements.txt .

# Upgrade pip
RUN pip3 install --upgrade pip

# Install futures separately (if necessary)
RUN pip3 install futures

# Install wheel
RUN pip3 install wheel

# Install the dependencies from requirements.txt with verbose output
RUN pip3 install --no-cache-dir -v -U -r requirements.txt

# Copy the rest of your project files into the container
COPY . .

# Set the default command to run the bot
CMD ["python3", "-m", "ShuKurenaiXRoBot"]
