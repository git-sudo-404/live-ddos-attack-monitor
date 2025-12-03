const REQ_URL = "https://www.gstatic.com/ddos-viz/attacks_v2.json";

const digital_attack_map_fetch = async () => {
  console.log("fetching...");

  const data = await fetch(REQ_URL);

  const res = await data.json();

  console.log(res);

  console.log(res.biggest.attacks[0]);
};

export default digital_attack_map_fetch;
