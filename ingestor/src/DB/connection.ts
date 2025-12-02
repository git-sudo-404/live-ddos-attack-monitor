import pg from "pg";

const pool = new pg.Pool({
  user: process.env.POSTGRES_USER,
  host: "pgdb",
  database: process.env.POSTGRES_DB,
  password: process.env.POSTGRES_PASSWORD,
});

export default pool;
