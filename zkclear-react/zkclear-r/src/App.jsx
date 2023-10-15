import { useState } from "react";
import reactLogo from "./assets/react.svg";
import aleoLogo from "./assets/aleo.svg";
import zkclear from "./assets/zkclearlogo.png";
import samplePDF from "./assets/anwb-factuur-7045753066.pdf";
import * as pdfjsLib from "pdfjs-dist";

const pdfjs = await import('pdfjs-dist/build/pdf');
const pdfjsWorker = await import('pdfjs-dist/build/pdf.worker.entry');

pdfjs.GlobalWorkerOptions.workerSrc = pdfjsWorker;

// define fs

import "./App.css";
import zkclear_program from "../helloworld/build/main.aleo?raw";
import { AleoWorker } from "./workers/AleoWorker.js";

// pdfjsLib.workerSrc =
//   "https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.7.570/pdf.worker.min.js";
  
const aleoWorker = AleoWorker();
function App() {
  const [count, setCount] = useState(0);
  const [account, setAccount] = useState(null);
  const [executing, setExecuting] = useState(false);
  const [deploying, setDeploying] = useState(false);

  const generateAccount = async () => {
    const key = await aleoWorker.getPrivateKey();
    setAccount(await key.to_string());
  };
// Parse contents of a PDF file into a string
  async function parsePDF() {
    const pdf = await pdfjsLib.getDocument(samplePDF).promise;
    const page = await pdf.getPage(1);
    const textContent = await page.getTextContent();
    const text = textContent.items.map((item) => item.str).join(" ");
    console.log(text);
  }

  async function execute() {
    setExecuting(true);
    const result = await aleoWorker.localProgramExecution(
      zkclear_program,
      "main",
      ["aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7", "aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7",
       "aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7", "1696763811805u64", "aleo1mgfq6g40l6zkhsm063n3uhr43qk5e0zsua5aszeq5080dsvlcvxsn0rrau"]
    );
    setExecuting(false);

    alert(JSON.stringify(result));
  }

  async function deploy() {
    setDeploying(true);
    try {
      const result = await aleoWorker.deployProgram(zkclear_program);
      console.log("Transaction:")
      console.log("https://explorer.hamp.app/transaction?id=" + result)
      alert("Transaction ID: " + result);
    } catch (e) {
      console.log(e)
      alert("Error with deployment, please check console for details");
    }
    setDeploying(false);
  }

 // function for print wallet address
  async function printWalletAddress() {
    var walletAddress = document.getElementById("walletAddress").value;
    console.log(walletAddress);
  }

  return (
    <>
      <div>
        <a href="https://aleo.org" target="_blank">
          <img src={zkclear} className="logo" alt="Aleo logo" />
        </a>
      </div>
      <h2> Generate Proof of Compliance</h2>
      <div className="card">
      <p>
          <input type="text" id="walletAddress" placeholder="Enter Wallet Address to be proved"></input>
        </p>
        <p>
          <button onClick={printWalletAddress}>
            Print Wallet Address
          </button>
        </p>
        {/* <button onClick={() => setCount((count) => count + 1)}>
          count is {count}
        </button> */}
        {/* <p>
          <button onClick={generateAccount}>
            {account
              ? `Account is ${JSON.stringify(account)}`
              : `Click to generate account`}
          </button>
        </p>         */}
        <p>
          <button onClick={parsePDF}>
            {`Read SDN pdf file`}
          </button>
        </p>
        
        <p>
          <button disabled={executing} onClick={execute}>
            {executing
              ? `Generating Proof...check console for details...`
              : `Generate Proof ZKClear Pass`}
          </button>
        </p>
        <p>
          <button onClick={execute}>
            {`Verify Proof zkClear.aleo`}
          </button>
        </p>
  
        {/* <p>
          Edit <code>src/App.jsx</code> and save to test HMR
        </p> */}
      </div>

      {/* Advanced Section */}
      <div className="card">
        <h2>Advanced Actions</h2>
        <p>
          Deployment on Aleo requires certain prerequisites like seeding your
          wallet with credits and retrieving a fee record. Check README for more
          details.
        </p>
        <p>
          <button disabled={deploying} onClick={deploy}>
            {deploying
              ? `Deploying...check console for details...`
              : `Deploy zkclear_program.aleo`}
          </button>
        </p>
      </div>
    </>
  );
}

export default App;
