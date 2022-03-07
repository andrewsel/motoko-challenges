// Motoko Bootcamp Day 1 Challenges

import Nat "mo:base/Nat";
import Array "mo:base/Array";

actor {

    // Challenge 1
    public func sum(n : Nat, m: Nat) : async Nat {
        return n + m;
    };

    // Challenge 2
    public func square(n: Nat) : async Nat {
        return n ** 2;
    };

    // Challenge 3
    public func days_to_seconds(n: Nat) : async Nat {
        return n * 24 * 60 * 60;
    };

    // Challenge 4
    var counter = 0;

    public func increment_counter() : async Nat {
      counter += 1;
      return counter;
    };

    public func clear_counter() : async Nat {
      counter := 0;
      return counter;
    };

    // Challenge 5
    public func divide(n: Nat, m: Nat) : async Bool {
      return n % m == 0;
    };

    // Challenge 6
    public func is_even(n: Nat) : async Bool {
      return n % 2 == 0;
    };

    // Challenge 7
    public func sum_of_array(array : [Nat]) : async Nat {
      var sum = 0;
      for (n in array.vals()) {
        sum += n;
      };
      return sum;
    };

    // Challenge 8
    public func maximum(array: [Nat]) : async Nat {
      var max = 0;
      for (n in array.vals()) {
        if (n > max) {
          max := n;
        }
      };
      return max;
    };

    // Challenge 9
    public func remove_from_array(array: [Nat], n: Nat) : async [Nat] {
        return Array.filter(array, func (val : Nat) : Bool {
            return val != n;
        });
    };

    // Challenge 10
    public func selection_sort(array : [Nat]) : async [Nat] {
        return Array.sort(array, Nat.compare);
    };

};