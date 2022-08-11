import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Debug "mo:base/Debug";
import Iter "mo:base/Iter";

actor Token{

    let owner: Principal = Principal.fromText("q53vu-5bdel-q2byr-zaudw-4pzpv-7f6cs-jtaxq-fzfty-zrgh3-zmezi-4qe");
    let totalSupply: Nat = 1000000000;
    let symbol: Text = "SAM";

    private stable var balanceEntries: [(Principal, Nat)] = [];

    private var balances = HashMap.HashMap<Principal,Nat>(1, Principal.equal, Principal.hash);

    if(balances.size() < 1){
        balances.put(owner, totalSupply);
    };

    // Get the current balance via a principal
    public query func balanceOf(who: Principal) : async Nat {
        
        let balance : Nat = switch (balances.get(who)) {
            case null 0;
            case (?result) result;
        };
        return balance;

    };

    // Get the symbol name of the token
    public query func getSymbol() : async Text {
        return symbol;
    }; 

    // Give the current principal a set amount of tokens
    public shared(msg) func payOut() : async Text {
        if(balances.get(msg.caller) == null){ // Verify if the principal has not claim their free tokens
            let amount = 10000;
            let result = await transfer(msg.caller, amount); // Substract tokens from the total pool of available tokens
            balances.put(msg.caller, amount);
            return result;
        } else{
            return "Alredy Claimed";
        }
    };

    // Transer a set amount of tokens to another principal
    public shared(msg) func transfer(to: Principal, amount: Nat) : async Text{

        let fromBalance = await balanceOf(msg.caller);

        if(fromBalance >= amount){ // Check if the recipient has enough tokens to make the transfer
            let newFromBalance : Nat = fromBalance-amount;
            balances.put(msg.caller, newFromBalance);

            let toBalance = await balanceOf(to);
            let NewToBalance = toBalance + amount;
            balances.put(to,NewToBalance);

            return "Success";
        } else {
            return "Insuficient funds";
        }

    };

    // Store the balances hashmap to the stable array before upgrading the canister
    system func preupgrade(){
        balanceEntries := Iter.toArray(balances.entries());
    };

    // Return the entries stored in the stable array back to the hashmap once the canister has upgraded
    system func postupgrade(){
        balances := HashMap.fromIter<Principal,Nat>(balanceEntries.vals(), 1, Principal.equal, Principal.hash);
        if(balances.size() < 1){
            balances.put(owner, totalSupply);
        }
    };

}