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

export interface A10NetworksAPIResponseType {
  ip: string;
  active: boolean;
  geolocation: GeoLocationType;
  category: string;
}

interface GeoLocationType {
  country_code2: string;
  autonomous_system_number: number;
  geolocation: LocationType;
  autonomous_system_organization: string;
  country_name: string;
}

interface LocationType {
  longitude: number;
  latitude: number;
}
