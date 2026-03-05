import express from "express";
import { ethers } from "ethers";

const app = express();
const FUJI_RPC = process.env.FUJI_RPC_URL;
const SEPOLIA_RPC = process.env.SEPOLIA_RPC_URL;
const FUJI_BRIDGE = "0xYourFujiBridgeAddress";
const SEPOLIA_BRIDGE = "0xYourSepoliaBridgeAddress";
const ABI = [ "event NFTSent(uint256 tokenId,address sender,address recipient,uint64 destinationChainId)",
              "event NFTReceived(uint256 tokenId,address recipient,uint64 sourceChainId)" ];

app.get("/status/:txHash", async (req, res) => {
  try {
    const provider = new ethers.JsonRpcProvider(FUJI_RPC);
    const receipt = await provider.getTransactionReceipt(req.params.txHash);
    if (!receipt) return res.json({ status: "Pending" });

    const iface = new ethers.Interface(ABI);
    const logs = receipt.logs.map(log => {
      try { return iface.parseLog(log); } catch { return null; }
    }).filter(Boolean);

    res.json({ status: "Confirmed", events: logs });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

app.listen(3000, () => console.log("Backend running on port 3000"));
