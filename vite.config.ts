import { defineConfig } from "vite";
import tailwindcss from "@tailwindcss/vite";
import swiftWasm from "@elementary-swift/vite-plugin-swift-wasm";

export default defineConfig({
  base: process.env.GITHUB_PAGES_BASE_PATH
    ? `${process.env.GITHUB_PAGES_BASE_PATH}/`
    : "/",
  plugins: [
    tailwindcss(),
    swiftWasm({
      useEmbeddedSDK: true,
    }),
  ],
});
