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

const A10_API_KEY = process.env.A10_ZOMBIE_INFO_API;

export default async function a10_zombie_info_fetch() {
  console.log("A10 fetching...");
  const response = await fetch(`${A10_API_KEY}`);
  const data = await response.json();

  console.log(data);
}
