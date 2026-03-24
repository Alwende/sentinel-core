FROM python:3.11-alpine
# psutil requires gcc and linux-headers on Alpine
RUN apk add --no-cache bash curl gcc musl-dev linux-headers
WORKDIR /app
COPY . .
RUN pip install --no-cache-dir flask psutil
EXPOSE 5000
ENV PYTHONUNBUFFERED=1
CMD ["python", "dashboard/app.py"]
