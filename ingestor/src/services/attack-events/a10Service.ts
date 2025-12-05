import "dotenv/config";
import type { A10NetworksAPIResponseType } from "../../types/external/attack-events/a10Netowrks.js";

const A10NETWORKS_EVENTS_API_ENDPOINT_URL =
  process.env.A10NETWORKS_EVENTS_API_ENDPOINT_URL;

async function a10NetworksAttackEventsFetch(): Promise<
  A10NetworksAPIResponseType[]
> {
  const response = await fetch(`${A10NETWORKS_EVENTS_API_ENDPOINT_URL}`);

  const data: A10NetworksAPIResponseType[] = await response.json();

  return data;
}

export default a10NetworksAttackEventsFetch;
