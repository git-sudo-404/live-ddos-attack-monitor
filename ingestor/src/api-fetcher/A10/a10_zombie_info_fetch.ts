//NOTE:
// A10networks API
// This code makes use of the the A10networks live ddos map monitor api
//
// What the API returns ?
// It returns an array of json objects
//
// HOw does the JSON look like ?
// Example :
// {
//   "ip": "112.43.114.101",
//   "aord": true,
//   "geoip": {
//     "country_code2": "CN",
//     "asn": 9808,
//     "location": {
//       "lon": 113.7266,
//       "lat": 34.7725
//     },
//     "as_org": "Guangdong Mobile Communication Co.Ltd.",
//     "country_name": "China"
//   },
//   "category": "coap"
// }

import "dotenv/config";
import type { A10ZombieRowValueType, A10ZombieType } from "./a10.types.js";
import { format } from "node-pg-format";
import pool from "../../DB/connection.js";

const A10_API_KEY = process.env.A10_ZOMBIE_INFO_API;

export default async function a10_zombie_info_fetch() {
  console.log("A10 fetching...");

  const response = await fetch(`${A10_API_KEY}`);
  const data: A10ZombieType[] = await response.json();

  const values: A10ZombieRowValueType[] = await data.map(
    (item: A10ZombieType) => {
      return [
        item.ip,
        item.aord,
        item.geoip?.country_code2,
        item.geoip?.location?.lat,
        item.geoip?.location?.lon,
        item.geoip?.asn,
        item.geoip?.as_org,
        item.geoip?.country_name,
        item.category,
      ];
    },
  );

  // console.log("VALUES : ", values);

  //NOTE: Whenever there is a conflict in INSERT queries , POSTGRESQL puts the new data into EXCLUDED table
  // This one works only if there is one extra duplicate or if the unique column appears again after an insertion.
  //  When it arrives the second time again in the same microsecond postgressql quits.
  //  SOLUTION:
  //    De - duplicate before sending to the database.
  //    use a map<ip_address,values>

  // const query_format_string = format(
  //   `
  //     INSERT INTO
  //     a10_zombie_info
  //     (ip_address,active,country_code_iso2,latitude,longitude,asn,as_org,country_name,category)
  //     VALUES
  //     %L
  //     ON CONFLICT (ip_address)
  //     DO UPDATE SET
  //     active = EXCLUDED.active,
  //     country_code_iso2 = EXCLUDED.country_code_iso2,
  //     latitude = EXCLUDED.latitude,
  //     longitude = EXCLUDED.longitude,
  //     asn = EXCLUDED.asn,
  //     as_org = EXCLUDED.as_org,
  //     country_name = EXCLUDED.country_name,
  //     category = EXCLUDED.category
  //   `,
  //   values,
  // );

  // DE - DUPLICATING

  const map = new Map<string, A10ZombieRowValueType>();

  for (const item of values) {
    map.set(item[0], item);
  }

  let upsert_values: A10ZombieRowValueType[] = [];

  // console.log(map);

  for (const k of map.keys()) {
    upsert_values.push(<A10ZombieRowValueType>map.get(k));
  }

  console.log("UPSERT VALS : ", upsert_values);

  const query_format_string = format(
    `
  INSERT INTO 
  a10_zombie_info (
    ip_address,
    active,
    country_code_iso2,
    latitude,
    longitude,
    asn,
    as_org,
    country_name,
    category
  )
  VALUES 
  %L 
  ON CONFLICT (ip_address) 
  DO UPDATE SET 
  active = EXCLUDED.active,
  country_code_iso2 = EXCLUDED.country_code_iso2,
  latitude = EXCLUDED.latitude,
  longitude = EXCLUDED.longitude,
  asn = EXCLUDED.asn,
  as_org = EXCLUDED.as_org,
  country_name = EXCLUDED.country_name,
  category = EXCLUDED.category
  `,
    upsert_values,
  );

  console.log("Executing Query...");

  pool.query(query_format_string, [], (err, result) => {
    console.log("ERROR : ", err);
    console.log("RESULT : ", result);
  });

  // console.log(data);
}
