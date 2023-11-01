import { useState } from "react";
import reactLogo from "./assets/react.svg";
import aleoLogo from "./assets/aleo.svg";
import zkclear from "./assets/zkclearlogo.png";
import "./App.css";
import helloworld_program from "../aleozkclear01/build/main.aleo?raw";
import { AleoWorker } from "./workers/AleoWorker.js";
import xml2js from 'xml2js';
import axios from "axios";

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


function daysDiff() {
  const date1 = new Date();
  const date2 = new Date("2023-09-28");
  const diffTime = Math.abs(date2 - date1);
  const DaysDiff = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
  return DaysDiff;
}

// Parsing the xml file at this URL https://www.treasury.gov/ofac/downloads/sanctions/1.0/sdn_advanced.xml
 async function parseXML() {
  const proxyUrl = 'http://localhost:8080/';
  const targetUrl = 'https://www.treasury.gov/ofac/downloads/sanctions/1.0/sdn_advanced.xml';
  axios.get(proxyUrl + targetUrl)
    .then(response => {
      xml2js.parseString(response.data, (err, result) => {
        if (err) {
          console.error(err);
        } else {
          const dateOfIssue = result['Sanctions']['DateOfIssue'][0];
          const year = dateOfIssue['Year'][0];
          const month = dateOfIssue['Month'][0];
          const day = dateOfIssue['Day'][0];
          console.log(`Year: ${year}, Month: ${month}, Day: ${day}`);
          console.log(dateOfIssue);
        }
      });
    })
    .catch(error => {
      console.error(error);
    });
}







//   //parse xml from this url   https://www.treasury.gov/ofac/downloads/sanctions/1.0/sdn_advanced.xml
//   const sampleXML = "https://www.treasury.gov/ofac/downloads/sanctions/1.0/sdn_advanced.xml";
//   const xml = await xml2js.parseString(sampleXML).promise;
//   const page = await xml.getPage(1);
//   const textContent = await page.getTextContent();
//   const text = textContent.items.map((item) => item.str).join(" ");
//   console.log(text);
// }




  async function execute() {
    setExecuting(true);
    // console log wallet address
    console.log("Checking for wallet address", document.getElementById("walletAddress").value.toString());
    console.log("Days difference between today and 28th september 2023", daysDiff().toString());
    const result = await aleoWorker.localProgramExecution(
      helloworld_program,
      "main",
      [ daysDiff().toString() +"u8", document.getElementById("walletAddress").value.toString()],
    );
    setExecuting(false)
    alert(JSON.stringify(result));
  }

  async function deploy() {
    setDeploying(true);
    try {
      const result = await aleoWorker.deployProgram(helloworld_program);
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

// function upload a pdf file
async function uploadPDF() {
  var pdfFile = document.getElementById("pdfFile").value;
  console.log(pdfFile);

}  
// run a python program using pyscript
async function runPythonProgram() {
  const { spawn } = require('child_process');
  const pyProg = spawn('python', ['./hello.py']);

  pyProg.stdout.on('data', function(data) {

      console.log(data.toString());
      res.send(data.toString());
  });
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
        <input style={{width: "300px", height: "30px"}} type="text" id="walletAddress" placeholder="Enter Wallet Address to be proved" />
      </p>
        <p>
          <button onClick={printWalletAddress}>
            Print Wallet Address
          </button>
        </p>
        <p>
          <button onClick={parseXML}>
            Parse XML file for Date
          </button>
        </p>
        <p>
          {/* <input type="file" id="pdfFile" placeholder="Upload PDF file"></input> */}
        </p>
        <p>
          <button  disabled = {true} onClick={uploadPDF}>
            Upload PDF file
          </button>
        </p>
        <p>
          <button   disabled = {true} onClick={parsePDF}>
            {`Read SDN pdf file`}
          </button>
        </p>
        <p>
          <button  disabled = {true} onClick={runPythonProgram }>
            {`Run Python Program`}
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
          <button disabled = {true} onClick={parsePDF}>
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
        <p>
          {/* increase the size of the button */}

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
