# ─────────────────────────────────────────────────────────────────────────────
# EoStudio v3.1.0 — Production Docker Image
# Supports: linux/amd64, linux/arm64
#
# Offline-first: All core features work without internet.
# AI features require either:
#   (a) OPENAI_API_KEY / ANTHROPIC_API_KEY env vars (cloud AI), OR
#   (b) Ollama running locally (fully offline AI)
# ─────────────────────────────────────────────────────────────────────────────

FROM python:3.11-slim AS base

LABEL org.opencontainers.image.title="EoStudio"
LABEL org.opencontainers.image.description="World's Most Powerful Universal Development Platform"
LABEL org.opencontainers.image.version="3.1.0"
LABEL org.opencontainers.image.source="https://github.com/embeddedos-org/EoStudio"
LABEL org.opencontainers.image.licenses="MIT"

# System dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# ─────────────────────────────────────────────────────────────────────────────
# Builder stage: install Python deps
# ─────────────────────────────────────────────────────────────────────────────
FROM base AS builder

COPY pyproject.toml ./
COPY eostudio/ ./eostudio/

RUN pip install --no-cache-dir -e ".[all]"

# ─────────────────────────────────────────────────────────────────────────────
# Final stage
# ─────────────────────────────────────────────────────────────────────────────
FROM builder AS final

COPY . .

# Default: no API key required — uses Ollama local mode
ENV EOSTUDIO_LLM_PROVIDER=ollama
ENV EOSTUDIO_OFFLINE=0
ENV PYTHONUNBUFFERED=1

# Web dashboard port
EXPOSE 7777

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD python3 -c "import eostudio; print('OK')" || exit 1

# Default command: show help
CMD ["python3", "-m", "eostudio.cli.main", "--help"]
