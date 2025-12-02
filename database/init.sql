CREATE TABLE ddos_attacks (

  id SERIAL UNIQUE PRIMARY KEY ,
  source_ip cidr,
  targer_ip cidr,
  time_of_attack timestamp,
  country VARCHAR(100)

);


CREATE TABLE blacklist(

  ip cidr,
  acore INTEGER,
  last_reported_at timestamp

);
