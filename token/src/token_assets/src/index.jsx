import ReactDOM from 'react-dom'
import React from 'react'
import App from "./components/App";
import { AuthClient } from '@dfinity/auth-client';

const init = async () => { 
    
    const authClient = await AuthClient.create();

    if(await authClient.isAuthenticated){ // Login if they are already authenticated
        handleAuthenticated(authClient);
    } else {
        await authClient.login({ // Ask the user to login
            identityProvider: "https://identity.ic0.app/#authorize",
            onSuccess: () => {
                handleAuthenticated(authClient);
            }
        });
    }

}

async function handleAuthenticated(authClient) {
    ReactDOM.render(<App />, document.getElementById("root"));
}

init();


