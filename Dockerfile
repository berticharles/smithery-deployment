    FROM ghcr.io/smithery-ai/smithery:latest
    CMD ["/bin/sh", "-c", "node /app/packages/api/dist/index.js"]
