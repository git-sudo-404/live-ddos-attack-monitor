CREATE TABLE ddos-attacks(

  id SERIAL UNIQUE PRIMARY KEY,
  source_ip cidr,
  target_ip cidr,
  country VARCHAR(100),
  time_of_attack timestamp

);
