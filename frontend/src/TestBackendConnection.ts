const TestBackendConnection = async () => {
  fetch("/api/test-connection")
    .then((data) => data.json())
    .then((res) => console.log(res))
    .catch((err) => console.log("Error connecting to Backend : ", err));
};

export default TestBackendConnection;
