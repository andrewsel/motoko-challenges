// Motoko Bootcamp Day 5 Challenges

import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";
import Array "mo:base/Array";

actor {

  private stable var favoriteNumberEntries : [(Principal, Nat)] = [];

  let favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

  public shared({caller}) func add_favorite_number(n: Nat) : () {
    favoriteNumber.put(caller, n);
  };

  public shared({caller}) func show_favorite_number() : ?Nat {
    if (caller == "2vxsx-fae") {
      return null;
    }
    return favoriteNumber.get(caller);
  };

  public shared({caller}) func add_favorite_number2(n: Nat) : Text {
    if (favoriteNumber.get(caller) == n) {
      return "You've already registered your number"
    }
    favoriteNumber.put(caller, n);
    return "You've successfully registered your number"
  };

  public shared({caller}) func update_favorite_number(n: Nat) : () {
    favoriteNumber.replace(caller, n);
  };

  public shared({caller}) func delete_favorite_number() : () {
    favoriteNumber.remove(caller);
  };

  system func preupgrade() {
		favoriteNumberEntries := Iter.toArray(favoriteNumber.entries());
	};

	system func postupgrade() {
		favoriteNumberEntries := [];
	};

}

