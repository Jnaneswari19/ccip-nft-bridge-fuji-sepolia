import { useState } from "react";

export default function BridgeStatus() {
  const [txHash, setTxHash] = useState("");
  const [status, setStatus] = useState(null);

  async function checkStatus() {
    const res = await fetch(`/status/${txHash}`);
    const data = await res.json();
    setStatus(data);
  }

  return (
    <div>
      <h3>Check Bridge Transaction Status</h3>
      <input value={txHash} onChange={e => setTxHash(e.target.value)} placeholder="Enter Tx Hash" />
      <button onClick={checkStatus}>Check</button>
      {status && <pre>{JSON.stringify(status, null, 2)}</pre>}
    </div>
  );
}
