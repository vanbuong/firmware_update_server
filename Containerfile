FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN firmware_update_server create-db
RUN firmware_update_server populate-db
RUN firmware_update_server add-user -u admin -p admin
EXPOSE 5000
CMD ["firmware_update_server", "run"]
