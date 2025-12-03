import pg from "pg";

const pool = new pg.Pool({
  user: process.env.POSTGRES_USER,
  host: "pgdb",
  database: process.env.POSTGRES_DB,
  password: process.env.POSTGRES_PASSWORD,
  max: 20,
  idleTimeoutMillis: 30000,
  connectionTimeoutMillis: 2000,
  maxLifetimeSeconds: 60,
});

export default pool;
