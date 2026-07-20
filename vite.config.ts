import { defineConfig } from "vite";
import swiftWasm from "@elementary-swift/vite-plugin-swift-wasm";

export default defineConfig({
  base: process.env.GITHUB_PAGES_BASE_PATH
    ? `${process.env.GITHUB_PAGES_BASE_PATH}/`
    : "/",
  plugins: [
    swiftWasm({
      useEmbeddedSDK: true,
    }),
  ],
});
