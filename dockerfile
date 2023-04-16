FROM node:16.19.1


RUN mkdir -p /var/www/html/node_modules
RUN chown -R node:node /var/www/html
# Install Nginx
RUN apt-get update && \
    apt-get install -y nginx

# Remove default Nginx configuration
RUN rm /etc/nginx/sites-enabled/default

# Copy custom Nginx configuration
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# Create a directory for the app
WORKDIR /var/www/html

# Copy package.json and package-lock.json
COPY ["package.json", "package-lock.json*", "./"]

# Install app dependencies
RUN npm install 
 

# Copy app files
ADD ./ /var/www/html


RUN chmod -R 777 /var/www/html
EXPOSE 80

# Start Nginx and the app
CMD service nginx start && npm start

