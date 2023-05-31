FROM python:3.8.16-slim-bullseye

ENV API_USER=test API_PASSWORD=test ECWID_PRIVATE_TOKEN=test \
    STORE_ID=123 PICKUP_LOCATION_ID=12324 ID_FIRST_VALUE=1 \
    SENDER_EMAIL=kba0708@gmail.com SENDER_PASSWORD=test

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt --no-cache-dir

COPY . .
EXPOSE 8081
ENTRYPOINT [ "python", "app.py" ]