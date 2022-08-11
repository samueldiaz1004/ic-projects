import React, { useState } from "react";
import {token} from "../../../declarations/token";

function Faucet() {

  const [isDisabled, setDisabled] = useState(false);
  const [btnText, setBtnText] = useState("Gimme Tokens");

  async function handleClick(event) {
    setDisabled(true);
    const result = await token.payOut();
    setBtnText(result);
  }

  return (
    <div className="blue window">
      <h2>
        <span role="img" aria-label="tap emoji">
          🚰
        </span>
        Faucet
      </h2>
      <label>Get your free Sam tokens here! Claim 10,000 SAM tokens to your account.</label>
      <p className="trade-buttons">
        <button id="btn-payout" onClick={handleClick} disabled={isDisabled}>
          {btnText}
        </button>
      </p>
    </div>
  );
}

export default Faucet;
