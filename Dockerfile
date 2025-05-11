FROM n8nio/n8n:latest

# Passe en root pour les installations
USER root

# Installe les dépendances natives requises pour sharp
RUN apt-get update && apt-get install -y \
    build-essential \
    libcairo2-dev \
    libjpeg-dev \
    libpango1.0-dev \
    libgif-dev \
    librsvg2-dev

# Installe firecrawl-mcp globalement
RUN npm install -g firecrawl-mcp

# Installe sharp (local pour le code node)
RUN npm install --omit=dev sharp

# Active l'import de modules dans le code node
ENV N8N_ENABLE_BUNDLED_CODE_RUNNER=true

# Reviens à l'utilisateur node (sécurité)
USER node
