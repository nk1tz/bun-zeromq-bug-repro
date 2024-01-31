# Use an official Node.js runtime as the base image
FROM node:21

# Set the working directory in the container to /app
WORKDIR /app

# Install cmake and libzmq3-dev
RUN apt-get update && apt-get install -y \
    cmake \
    libzmq3-dev

# Copy package.json and bun.lock to the working directory
COPY package.json ./

# Install bun using the provided shell script
RUN curl -fsSL https://bun.sh/install | bash && mv $HOME/.bun/bin/bun /usr/local/bin/bun

# Install any needed packages specified in package.json
RUN bun i --verbose

# Bundle the app source inside the Docker image
COPY index.ts .

# Make port 3333 available to the world outside the container
EXPOSE 3333

# Define the command to run the app
CMD [ "bun", "run", "index.ts"]