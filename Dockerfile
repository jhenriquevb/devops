# ── Stage 1: Testes ───────────────────────────────────────────────────────────
FROM python:3.11-slim AS test

WORKDIR /app

COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ .

RUN pytest tests/ -v --cov=. --cov-report=term-missing

# ── Stage 2: Produção ────────────────────────────────────────────────────────
FROM python:3.11-slim AS production

LABEL maintainer="devops-fase1"
LABEL description="API Flask — DevOps na Prática"

WORKDIR /app

RUN groupadd -r flask && useradd -r -g flask flask

COPY app/requirements.txt .
RUN pip install --no-cache-dir flask==3.0.3

COPY app/app.py .

USER flask

EXPOSE 5000

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
    CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:5000/health')" || exit 1

CMD ["python", "app.py"]
