FROM python:3.11-alpine
RUN apk add --no-cache bash curl
WORKDIR /app
COPY . .
RUN pip install --no-cache-dir flask
EXPOSE 5000
ENV PYTHONUNBUFFERED=1
# Force the Dashboard to run, keeping the container alive
CMD ["python", "dashboard/app.py"]
