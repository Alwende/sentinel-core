FROM python:3.11-alpine
RUN apk add --no-cache bash curl gcc musl-dev linux-headers libpq-dev
WORKDIR /app
COPY . .
RUN pip install --no-cache-dir flask psutil requests psycopg2-binary
EXPOSE 5000
CMD ["python", "dashboard/app.py"]
