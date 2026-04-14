FROM python:3.11-slim AS builder

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir --target=/app/deps -r requirements.txt

COPY app.py .

FROM gcr.io/distroless/python3-debian12

WORKDIR /app

COPY --from=builder /app /app

CMD ["/usr/bin/python3", "/app/app.py"]
