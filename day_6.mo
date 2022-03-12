// Motoko Bootcamp Day 5 Challenges

import Cycles "mo:base/ExperimentalCycles";
import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";
import HTTP "http";
import Text "mo:base/Text";

actor {

  // Challenge 1
  private Type TokenIndex = Nat;
  private type Error = {
      #notFound;
      #alreadyExists;
      #notValid;
  };

  private stable var registryEntries : [(TokenIndex, Principal)] = [];
  // Challenge 2
  private let registry : HashMap.HashMap<TokenIndex, Principal> = HashMap.fromIter<TokenId, Principal>(ownersEntries.vals(), 0, Nat.equal, Hash.hash);

  // Challenge 3
  stable var nextTokenIndex : Nat = 0;

  public type Result = Result.Result;
  public shared ({caller}) func mint() : async Result<(), Text> {
      if(Principal.isAnonymous(caller)){
          return #err("Anonomous caller").
      } else {
          nextTokenIndex += 1;
          registry.put(nextTokenIndex, caller)
          return #ok;
      }
  };

  // Challenge 4
  public shared ({caller}) func transfer(to : Principal, tokenIndex : Nat) : async Result<(), Text> {
      if(Principal.isAnonymous(caller)){
          return #err("Anonomous caller").
      } else {
          nextTokenIndex += 1;
          registry.put(tokenIndex, to)
          return #ok;
      };
  };

  // Challenge 5
  public shared ({caller}) func balance() : async Result<(), [TokenIndex]> {
      if(Principal.isAnonymous(caller)){
          return #err("Anonomous caller").
      } else {
          let array : [TokenIndex] = [];
          for ((key, value) in registry.entries()) {
              let token : Nat = key;
              array := Array.append(array, [token]);
          };
          return array;
      };
  };

  // Challenge 6
  public query func http_request(request : HTTP.Request) : async HTTP.Response {
      let key : Nat = registry.size;
      let response = {
          body = Text.encodeUtf8(nextTokenIndex + " minted so far. Last was " + registry.get(key));
          headers = [("Content-Type", "text/html; charset=UTF-8")];
          status_code = 200 : Nat16;
          streaming_strategy = null;
          return(response);
      };
  };

  // Challenge 7
 	system func preupgrade() {
		registryEntries := Iter.toArray(registry.entries());
	};

	system func postupgrade() {
    registryEntries := [];
	};


}

