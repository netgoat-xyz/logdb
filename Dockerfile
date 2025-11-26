# =============================
# 🐐 NetGoat | MicroService | LogDB
# =============================
# Maintainer: Duckey Dev <ducky@cloudable.dev>
# Description: Lightweight production container for ElysiaJS-based LogDB service
# =============================

FROM oven/bun:latest AS production

LABEL org.opencontainers.image.title="NetGoat LogDB" \
      org.opencontainers.image.description="Lightweight ElysiaJS microservice for NetGoat (LogDB)" \
      org.opencontainers.image.authors="Duckey Dev <ducky@cloudable.dev>" \
      org.opencontainers.image.source="https://github.com/Cloudable-dev/netgoat" \
      org.opencontainers.image.licenses="MIT"

# ---- Working Directory ----
WORKDIR /app

# ---- Copy Files ----
# Copy only what’s needed (Docker will use .dockerignore for the rest)
COPY bun.lock package.json ./
RUN bun install --frozen-lockfile --production

COPY . .

# ---- Environment ----
ENV NODE_ENV=production

# ---- Expose Port ----
EXPOSE 3010

# ---- Start Server ----
CMD ["bun", "run", "start"]