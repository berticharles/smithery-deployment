# 1. Começamos com a base pública que sabemos que funciona.
FROM node:20-alpine

# 2. Instalamos o 'git' para podermos baixar o código-fonte.
RUN apk add --no-cache git

# 3. Definimos nosso diretório de trabalho.
WORKDIR /app

# 4. Baixamos o código-fonte do Smithery diretamente do GitHub.
#    Isso bypassa completamente o registro privado ghcr.io.
RUN git clone https://github.com/smithery-ai/smithery.git .

# 5. Instalamos as dependências do projeto.
RUN npm install

# 6. Construímos a aplicação. O Smithery é um monorepo, então precisamos
#    construir o pacote específico da API.
RUN npm run build --workspace @smithery/api

# 7. O comando final para iniciar o servidor da API.
CMD ["node", "packages/api/dist/index.js"]
