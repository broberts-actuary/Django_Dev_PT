FROM python:3
RUN apt-get update && apt-get upgrade -y && apt-get autoremove && apt-get autoclean
RUN apt-get install -y \
    libffi-dev \
    libssl-dev \
    libxml2-dev \
    libxslt-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zlib1g-dev \
    net-tools \
    vim \
    apache2 \
    libapache2-mod-wsgi-py3 \
    python3-psycopg2
WORKDIR /usr/src/app
COPY . .
COPY webserver_settings/000-default.conf /etc/apache2/sites-available/000-default.conf
RUN pip install --no-cache-dir -r requirements.txt
RUN mv /usr/lib/python3/dist-packages/psycopg2* /usr/local/lib/python3.7/site-packages
EXPOSE 80
CMD apachectl -D FOREGROUND
