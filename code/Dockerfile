FROM python:3.6-slim

WORKDIR /app
COPY . /app

RUN apt-get update -y
RUN apt-get install -y python3-pip python3-dev

RUN pip install -r requirements.txt

RUN chown -R www-data:www-data /app
RUN chmod 755 /app
USER www-data

RUN chmod +x ./start.sh
CMD ["./start.sh"]