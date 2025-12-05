import pg from "pg";

const POSTGRES_USER = process.env.POSTGRES_USER;
const POSTGRES_DB = process.env.POSTGRES_DB;
const POSTGRES_PASSWORD = process.env.POSTGRES_PASSWORD;
const POSTGRES_HOST = process.env.POSTGRES_HOST || "pgdb";

const pool = new pg.Pool({
  user: POSTGRES_USER,
  host: POSTGRES_HOST,
  database: POSTGRES_DB,
  password: POSTGRES_PASSWORD,
  max: 20,
  idleTimeoutMillis: 30000,
  connectionTimeoutMillis: 2000,
  maxLifetimeSeconds: 60,
});

export default pool;
