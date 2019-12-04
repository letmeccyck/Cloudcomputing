#!/bin/bash

#wordpress
rsync -avP /wordpress/ /var/www/html/
mkdir /var/www/html/wp-content/uploads
chown -R apache:apache /var/www/html/*

