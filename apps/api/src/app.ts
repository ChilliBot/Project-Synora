import Fastify from "fastify";
import { serviceInfo } from "@synora/contracts";

export function buildApp() {
  const app = Fastify({ logger: false });
  app.get("/health", async () => ({ status: "ok", service: serviceInfo.api }));
  return app;
}
