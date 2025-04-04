FROM python:3.9.21-bullseye
COPY ./app /app
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt && apt update && apt install -y dumb-init && apt-get clean && rm -rf /var/lib/apt/lists/*
EXPOSE 5000
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["python3.9", "app.py"]