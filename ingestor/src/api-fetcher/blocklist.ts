import "dotenv/config";

const ABUSEIPDB_API_KEY = process.env.ABUSEIPDB_API_KEY;
const BLOCKLIST_API_ENDPOINT = process.env.ABUSEIPDB_BLOCKLIST_API_ENDPOINT;

async function getBlockList(
  confidenceMinimumScore: number = 90,
  key: string = `${ABUSEIPDB_API_KEY}`,
) {
  console.log("API KEY : ", ABUSEIPDB_API_KEY);
  console.log("EBDPOINT : ", BLOCKLIST_API_ENDPOINT);

  //NOTE: using the below code the '?' for the query params will not be automatically added, you have add the '?' right after the BLOCKLIST_API_ENDPOINT

  // const blocklist_query_string: Request = new Request(
  //   `${BLOCKLIST_API_ENDPOINT}` +
  //   new URLSearchParams({
  //     confidenceMinimum: `${confidenceMinimumScore}`,
  //   }),
  //   {
  //     method: "GET",
  //     headers: {
  //       Accept: "application/json",
  //       Key: `${ABUSEIPDB_API_KEY}`,
  //     },
  //   },
  // );

  //NOTE: Instead make use of the URL class , it handles it automatically

  const blocklist_url = new URL(`${BLOCKLIST_API_ENDPOINT}`);
  blocklist_url.search = new URLSearchParams({
    confidenceMinimum: `${confidenceMinimumScore}`,
  }).toString();

  const blocklist_fetch_request = new Request(blocklist_url, {
    method: `GET`,
    headers: {
      Accept: "application/json",
      Key: `${ABUSEIPDB_API_KEY}`,
    },
  });

  const data = await fetch(blocklist_fetch_request);

  console.log(data);

  console.log("JSON : \n", data.json());
}

export default getBlockList;
