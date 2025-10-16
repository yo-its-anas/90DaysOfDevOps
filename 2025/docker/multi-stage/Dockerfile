# Stage 1
FROM python:3.13.9-alpine3.22 AS builder

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt --target=/app/deps

#Stage 2
FROM gcr.io/distroless/python3

WORKDIR /app

COPY --from=builder /app/deps /app/deps

COPY --from=builder /app .

ENV PYTHONPATH="/app/deps"


EXPOSE 8080

CMD ["main.py"]
