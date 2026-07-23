FROM node:22.23.1-bookworm AS toolchain

ARG SWIFT_VERSION=6.3.0
ARG SWIFT_SDK_URL=https://download.swift.org/swift-6.3-release/wasm-sdk/swift-6.3-RELEASE/swift-6.3-RELEASE_wasm.artifactbundle.tar.gz
ARG SWIFT_SDK_CHECKSUM=9fa4016ee632c7e9e906608ec3b55cf13dfc4dff44e47574c5af58064dc33fd9

ENV SWIFTLY_HOME_DIR=/root/.local/share/swiftly
ENV SWIFTLY_BIN_DIR=/root/.local/share/swiftly/bin
ENV PATH=/root/.local/share/swiftly/bin:${PATH}

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update \
  && apt-get install --yes --no-install-recommends \
    binaryen \
    ca-certificates \
    curl \
    git \
    libcurl4-openssl-dev \
    libedit-dev \
    libpython3-dev \
  && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL \
    "https://download.swift.org/swiftly/linux/swiftly-$(uname -m).tar.gz" \
    -o /tmp/swiftly.tar.gz \
  && tar -xzf /tmp/swiftly.tar.gz -C /tmp \
  && /tmp/swiftly init \
    --skip-install \
    --quiet-shell-followup \
    --assume-yes \
  && . "${SWIFTLY_HOME_DIR}/env.sh" \
  && swiftly install "${SWIFT_VERSION}" --use --assume-yes \
  && rm -f /tmp/swiftly /tmp/swiftly.tar.gz

RUN swift sdk install "${SWIFT_SDK_URL}" --checksum "${SWIFT_SDK_CHECKSUM}"

RUN test "$(node --version)" = "v22.23.1" \
  && test "$(npm --version)" = "10.9.8" \
  && swift --version \
  && swift sdk list \
  && wasm-opt --version

ENV GITHUB_PAGES_BASE_PATH=/SwiftRPCWebsite

COPY scripts/container-entrypoint /usr/local/bin/container-entrypoint

RUN chmod 755 /usr/local/bin/container-entrypoint

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/container-entrypoint"]
