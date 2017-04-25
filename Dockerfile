FROM ubuntu:14.04

MAINTAINER Kiran Anil

# Update the sources list
RUN apt-get update

# Install basic applications
RUN apt-get install -y tar git curl nano wget dialog net-tools build-essential

# Install Python and Basic Python Tools
RUN apt-get install -y python python-dev python-distribute python-pip

RUN apt-get install -y python-django

ADD /mydocapp /mydocapp

# Expose ports
EXPOSE 8001

WORKDIR /mydocapp/

CMD python manage.py migrate

CMD python-admin createsuperuser --username==kiran --password=admin

CMD python manage.py runserver 0.0.0.0:8001




