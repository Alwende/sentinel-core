FROM python:3.11-slim
WORKDIR /app
RUN pip install requests psycopg2-binary
COPY engine.py .
CMD ["python", "engine.py"]
