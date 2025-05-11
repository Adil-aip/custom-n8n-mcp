FROM n8nio/n8n:latest

USER root

# Installer les dépendances requises pour sharp sur Alpine
RUN apk add --no-cache \
  build-base \
  libc6-compat \
  cairo-dev \
  jpeg-dev \
  pango-dev \
  giflib-dev \
  librsvg-dev

# Installer firecrawl (ton module global existant)
RUN npm install -g firecrawl-mcp

# Installer sharp (module local compatible avec n8n)
RUN npm install --omit=dev sharp

# Activer les modules dans les nodes Code
ENV N8N_ENABLE_BUNDLED_CODE_RUNNER=true

USER node
