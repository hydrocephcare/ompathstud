interface Env {
  DB: D1Database;
}

const json = (data: unknown, status = 200): Response =>
  new Response(JSON.stringify(data), {
    status,
    headers: {
      "content-type": "application/json; charset=utf-8",
      "cache-control": "no-store",
    },
  });

export default {
  async fetch(request: Request, env: Env): Promise<Response> {
    const url = new URL(request.url);

    if (url.pathname === "/health" && request.method === "GET") {
      try {
        const result = await env.DB
          .prepare("SELECT COUNT(*) AS table_count FROM sqlite_master WHERE type = 'table'")
          .first<{ table_count: number }>();

        return json({
          service: "ompathstudy-api-staging",
          status: "ok",
          database: "connected",
          tableCount: result?.table_count ?? 0,
        });
      } catch {
        return json({
          service: "ompathstudy-api-staging",
          status: "degraded",
          database: "unavailable",
        }, 503);
      }
    }

    return json({ error: "Not found" }, 404);
  },
};
