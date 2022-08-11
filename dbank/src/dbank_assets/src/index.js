// Steps to run App
// >> npm install
// >> dfx start
// >> dfx deploy
// >> npm start

import {dbank} from "../../declarations/dbank";

// Show the currentValue
window.addEventListener("load", async () => {
    update();
});

// Handle form input
document.querySelector("form").addEventListener("submit", async (event) => {
    event.preventDefault(); // Prevent loading the page after submition

    const button = event.target.querySelector("#submit-btn");

    const inputAmount = parseFloat(document.getElementById("input-amount").value);
    const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

    button.setAttribute("disabled", true); // Disable button presses while the transaction occurs

    // Avoid saving empty inputs (NaN) to the currentValue and breaking the app
    if(document.getElementById("input-amount").value.length != 0){
        await dbank.topUp(inputAmount);
    }

    if(document.getElementById("withdrawal-amount").value.length != 0){
        await dbank.withdraw(outputAmount);
    }

    await dbank.compound(); // Add compund after operation

    update(); // Show the currentValue

    // Clear inputs
    document.getElementById("input-amount").value = "";
    document.getElementById("withdrawal-amount").value = "";

    button.removeAttribute("disabled"); // Enable the button after everything is done
});

async function update(){
    const currentAmount = await dbank.checkBalance();
    document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;
}