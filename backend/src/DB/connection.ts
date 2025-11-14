//NOTE: Refer https://node-postgres.com/ for more info .

import pg from "pg";
const { Pool, Client } = pg;

//NOTE: Pool vs Client
//Pool - uses a pool of clients , so whenever you query it selects a client from the pool and query's using that client and returns
//        that client back to the pool .
//Client - You create a client , which establishes a connection and then you query and then you close the connection which is slow
//          since you have to create a connection in order to query everytime .

const DB_USER = process.env.DB_USER;
const DB_PASSWORD = process.env.DB_PASSWORD;
const DB = process.env.DB;

console.log(DB_USER, DB_PASSWORD, DB);

const pool = new Pool({
  user: `${DB_USER}`,
  password: `${DB_PASSWORD}`,
  host: "postgres-db", // Service name of the db
  port: 5432,
  database: `${DB}`,
});

console.log(
  await pool.query(
    "SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' ",
  ),
);

export default pool;

// const client = new Client({
//   user: "dbuser",
//   password: "secretpassword",
//   host: "database.server.com",
//   port: 3211,
//   database: "mydb",
// });
//
// await client.connect();

// console.log(await client.query("SELECT NOW()"));
//
// await client.end();
