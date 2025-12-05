import "dotenv/config";

const FORTINET_EVENTS_API_ENDPOINT_URL =
  process.env.FORTINET_EVENTS_API_ENDPOINT_URL;

async function fortinetAttackEventsFetch() {
  console.log("Fetching url .... ", FORTINET_EVENTS_API_ENDPOINT_URL);

  const response = await fetch(`${FORTINET_EVENTS_API_ENDPOINT_URL}`);

  const data = await response.json();

  console.log(data);
}

export default fortinetAttackEventsFetch;
