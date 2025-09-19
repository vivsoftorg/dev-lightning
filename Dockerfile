ARG BASE=node:22.8.0
FROM ${BASE} AS base

WORKDIR /app

# Install dependencies
COPY package.json pnpm-lock.yaml ./
RUN npm install -g pnpm && pnpm install

# Copy the rest of the application code
COPY . .

# Expose the port
EXPOSE 5173


FROM base AS development

ARG VITE_LOG_LEVEL=debug
ARG DEFAULT_NUM_CTX
ARG VITE_PUBLIC_APP_URL
ARG VITE_SERVER_ALLOWED_HOSTS
ARG VITE_BASE_PATH

ENV VITE_LOG_LEVEL=${VITE_LOG_LEVEL} \
    DEFAULT_NUM_CTX=${DEFAULT_NUM_CTX} \
    RUNNING_IN_DOCKER=true \
    VITE_SERVER_ALLOWED_HOSTS=${VITE_SERVER_ALLOWED_HOSTS} \
    VITE_PUBLIC_APP_URL=${VITE_PUBLIC_APP_URL}\
    VITE_BASE_PATH=${VITE_BASE_PATH}

RUN mkdir -p ${WORKDIR}/run

CMD ["pnpm", "run", "dev", "--host"]
