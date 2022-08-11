// http://localhost:8000/?canisterId=r7inp-6aaaa-aaaaa-aaabq-cai&id=rrkah-fqaaa-aaaaa-aaaaq-cai
// dfx canister id __Candid_UI = r7inp-6aaaa-aaaaa-aaabq-cai
// dfx canister id dbank = rrkah-fqaaa-aaaaa-aaaaq-cai

import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank{
    stable var currentValue : Float = 300;
    currentValue := 300;

    stable var startTime = Time.now();
    startTime := Time.now();

    // let id = 4372498639463;
    // Debug.print(debug_show(id));

    public func topUp(amount: Float){
        currentValue += amount;
        Debug.print(debug_show(currentValue));
    };

    public func withdraw(amount: Float){
        let tempValue : Float = currentValue-amount;
        if(tempValue >= 0){
            currentValue -= amount;
            Debug.print(debug_show(currentValue));
        }
        else{
            Debug.print("Cannot withdraw amount");
        }
    };

    public query func checkBalance() : async Float{
        return currentValue;
    };

    public func compound(){
        let currentTime = Time.now();
        let timeElapsedNS = currentTime - startTime;
        let timeElapsedS = timeElapsedNS / 1000000000;
        currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
        startTime := currentTime;
    };

}