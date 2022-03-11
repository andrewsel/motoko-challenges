// Motoko Bootcamp Day 5 Challenges

import Cycles "mo:base/ExperimentalCycles";
import HashMap "mo:base/HashMap";


actor {

  // Challenge 1
  public shared({caller}) func is_anonymous() : async Bool {
    if (caller == "2vxsx-fae") {
      return true;
    }
    return false;
  };

  // Challenge 2
  let favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

  // Challenge 3
  public shared({caller}) func add_favorite_number(n: Nat) : () {
    favoriteNumber.put(caller, n);
  };

  public shared({caller}) func show_favorite_number() : ?Nat {
    if (caller == "2vxsx-fae") {
      return null;
    }
    return favoriteNumber.get(caller);
  };

  // Challenge 4
  public shared({caller}) func add_favorite_number2(n: Nat) : Text {
    if (favoriteNumber.get(caller) == n) {
      return "You've already registered your number"
    }
    favoriteNumber.put(caller, n);
    return "You've successfully registered your number"
  };

  // Challenge 5
  public shared({caller}) func update_favorite_number(n: Nat) : () {
    favoriteNumber.replace(caller, n);
  };

  public shared({caller}) func delete_favorite_number() : () {
    favoriteNumber.remove(caller);
  };

  // Challenge 6
  public func deposit_cycles() : async Nat {
    return Cycles.accept(100_000);
  };

  // Challenge 8
  stable var counter = 0;
  stable var versionNumber = 1;

  public func increment_counter() : async Nat {
    counter += 1;
    return counter;
  };

  public func clear_counter() : async Nat {
    counter := 0;
    return counter;
  };

  system func postupgrade() {
    versionNumber += 1;
  };
  };

}

