import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import tailwindcss from "@tailwindcss/vite";

// https://vite.dev/config/
export default defineConfig({
  plugins: [react(), tailwindcss()],
  server: {
    // This is the Vite-equivalent of the package.json "proxy"
    proxy: {
      // This rule will catch all requests starting with /api
      "/api": {
        // This is the target: your backend container
        target: "http://backend:8080",

        // This is important for virtual hosts
        changeOrigin: true,
      },
    },
  },
});
