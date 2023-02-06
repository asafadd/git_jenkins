FROM python:3.8-alpine
WORKDIR /app
COPY . /app
RUN apk add build-base
RUN apk add build-base linux-headers
RUN pip install -r requirements.txt
CMD ["python", "-m memory_profiler", "./app/main.py"]
