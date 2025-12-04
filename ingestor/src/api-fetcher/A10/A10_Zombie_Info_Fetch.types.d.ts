export interface A10ZombieType {
  ip: string;
  aord: boolean;
  geoip: geoipType;
  category: string;
}

interface GeoipType {
  country_code2: string;
  asn: number;
  location: locationType;
  as_org: string;
  country_name: string;
}

interface LocationType {
  lon: number;
  lat: number;
}

export type A10ZombieRowValueType = [
  string,
  boolean,
  string,
  number,
  number,
  number,
  string,
  string,
  string,
];
