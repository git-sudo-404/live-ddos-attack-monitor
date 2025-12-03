CREATE TABLE ddos_attacks (

  id SERIAL UNIQUE PRIMARY KEY ,
  source_ip cidr,
  targer_ip cidr,
  time_of_attack timestamp,
  country VARCHAR(100)

);


CREATE TABLE blacklist(

  ip cidr,
  score INTEGER,
  last_reported_at timestamp

);

CREATE TABLE a10_zombie_info(
  
  ID SERIAL PRIMARY KEY,
  ip_address INET,
  active BOOLEAN,
  country_code_iso2 VARCHAR(2),
  latitude DECIMAL,
  longitude DECIMAL,
  asn INTEGER, -- Autonomous System Number 
  as_org TEXT, -- Autonomous System Organization Name
  category VARCHAR(20)

);
