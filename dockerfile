FROM node:16.19.1
USER root 


# Install Nginx
RUN apt-get update && \
    apt-get install -y nginx


RUN rm /etc/nginx/sites-enabled/default

# Copy custom Nginx configuration
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# Create a directory for the app
WORKDIR /var/www/html

# Copy package.json and package-lock.json
COPY package*.json ./

# Install app dependencies
RUN npm install 

# Copy app file
ADD ./  /var/www/html 


RUN chmod -R 777 /var/www/html
RUN chown -R node:node /var/www/html
EXPOSE 80

# Start Nginx and the app
CMD service nginx start && npm start

