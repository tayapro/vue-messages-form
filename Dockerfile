# Base image
FROM python:3.7.14-alpine
WORKDIR /app

COPY dist .
COPY python-server.sh .

EXPOSE 8080
CMD ["sh", "python-server.sh"]