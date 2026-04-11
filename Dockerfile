FROM python:3.11-alpine
RUN apk add --no-cache bash curl gcc musl-dev linux-headers
WORKDIR /app
COPY . .
RUN pip install --no-cache-dir flask prometheus-client requests psutil
EXPOSE 9090
EXPOSE 5000
CMD ["python", "engine.py"]
