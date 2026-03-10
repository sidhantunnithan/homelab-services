# Builds happy-server from upstream source.
# Fixes upstream Dockerfile.server which is missing `COPY patches ./patches`,
# causing postinstall.cjs to fail with MODULE_NOT_FOUND.

FROM alpine/git AS clone
RUN git clone --depth 1 https://github.com/slopus/happy.git /happy

FROM node:20 AS deps
RUN apt-get update && apt-get install -y python3 ffmpeg make g++ build-essential && rm -rf /var/lib/apt/lists/*
WORKDIR /repo
COPY --from=clone /happy/package.json /happy/yarn.lock ./
COPY --from=clone /happy/scripts ./scripts
COPY --from=clone /happy/patches ./patches
RUN mkdir -p packages/happy-app packages/happy-server packages/happy-cli packages/happy-wire
COPY --from=clone /happy/packages/happy-app/package.json packages/happy-app/
COPY --from=clone /happy/packages/happy-server/package.json packages/happy-server/
COPY --from=clone /happy/packages/happy-cli/package.json packages/happy-cli/
COPY --from=clone /happy/packages/happy-wire/package.json packages/happy-wire/
COPY --from=clone /happy/packages/happy-app/patches packages/happy-app/patches
COPY --from=clone /happy/packages/happy-server/prisma packages/happy-server/prisma
COPY --from=clone /happy/packages/happy-cli/scripts packages/happy-cli/scripts
COPY --from=clone /happy/packages/happy-cli/tools packages/happy-cli/tools
RUN SKIP_HAPPY_WIRE_BUILD=1 yarn install --frozen-lockfile --ignore-engines

FROM deps AS builder
COPY --from=clone /happy/packages/happy-wire ./packages/happy-wire
COPY --from=clone /happy/packages/happy-server ./packages/happy-server
RUN yarn workspace @slopus/happy-wire build
RUN yarn workspace happy-server build

FROM node:20 AS runner
WORKDIR /repo
RUN apt-get update && apt-get install -y python3 ffmpeg && rm -rf /var/lib/apt/lists/*
ENV NODE_ENV=production
COPY --from=builder /repo/node_modules /repo/node_modules
COPY --from=builder /repo/packages/happy-wire /repo/packages/happy-wire
COPY --from=builder /repo/packages/happy-server /repo/packages/happy-server
EXPOSE 3000
CMD ["yarn", "--cwd", "packages/happy-server", "start"]
