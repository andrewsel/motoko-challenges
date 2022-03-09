// Motoko Bootcamp Day 3 Challenges

import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Iter "mo:base/Iter";
import Char "mo:base/Char";
import Option "mo:base/Option";

actor {

  // Challenge 1
  func swap<T>(array: [var T], j: Nat, i: Nat): [var T] {
    let valJ = array[j];
    let valI = array[i];
    array[j] := valI;
    array[i] := valJ;
    return array;
  };

  // Challenge 2
  public func init_count(n: Nat) : async [Nat] {
    return Iter.toArray<Nat>(Iter.range(0, n-1));
  };

  // Challenge 3
  public func seven(array: [Nat]) : async Text {
    let sevenChar : Nat32 = 55;
    for (v in array.vals()) {
      let t : Text = Nat.toText(v);
      for (c in Text.toIter(t)) {
        if (Char.toNat32(c) == sevenChar) {
          return "Seven is found";
        };
      };
    };
    return "Seven not found";
  };

  // Challenge 4
  public func nat_opt_to_nat(n: ?Nat, m: Nat) : async Text {
    switch(n){
      case(null) {
        return Nat.toText(m);
      };
      case(?something){
        return Nat.toText(something);
      };
    };
  };

  // Challenge 5
  public func day_of_the_week(n: Nat) : async ?Text {
    let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
    if (n >= 1 and n <= 7) {
        return ?days[n-1];
    };
    return null;
  };

  // Challenge 6
  public func populate_array(array: [?Nat]) : async [Nat] {
    let f = func (n : ?Nat) : Nat {
      return Option.get(n, 0)
    };
    return Array.map<?Nat, Nat>(array, f);
  };

  // Challenge 7
  public func sum_of_array(array: [Nat]) : async Nat {
    var sum : Nat = 0;
    let f = func (n : Nat) : Nat {
      sum += n;
      return n;
    };
    let mapped = Array.map<Nat, Nat>(array, f);
    return sum;
  };

  // Challenge 8
  public func squared_array(array: [Nat]) : async [Nat] {
    let f = func (n : Nat) : Nat {
      return n ** 2;
    };
    return Array.map<Nat, Nat>(array, f);
  };

  // Challenge 9
  public func increase_by_index(array: [Nat]) : async [Nat] {
    let f = func (n : Nat, i : Nat) : Nat {
      return n + i;
    };
    return Array.mapEntries<Nat, Nat>(array, f);
  };

  // Challenge 10
  func contains<A>(arr: [A], a: A, f: ((A, A)) -> Bool): async Bool {
    for (n in arr.vals()){
        if ( f(n, a) ) {
            return true;
        };
    };
    return false;
  };

}

