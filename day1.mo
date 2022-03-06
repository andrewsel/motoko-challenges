// Motoko Bootcamp daily challenge 1

import Nat "mo:base/Nat";
import Array "mo:base/Array";

actor {

    // Challenge 1 : Write a function add that takes two natural numbers n and m and returns the sum.
    public func sum(n : Nat, m: Nat) : async Nat {
        return n + m;
    };

    // Challenge 2 : Write a function square that takes a natural number n and returns the area of a square of length n.
    public func square(n: Nat) : async Nat {
        return n ** 2;
    };

    // Challenge 3 : Write a function days_to_second that takes a number of days n and returns the number of seconds.
    public func days_to_seconds(n: Nat) : async Nat {
        return n * 24 * 60 * 60;
    };

    // Challenge 4 : Write two functions increment_counter & clear_counter .
    var counter = 0;

    public func increment_counter() : async Nat {
      counter += 1;
      return counter;
    };

    public func clear_counter() : async Nat {
      counter := 0;
      return counter;
    };

    // Challenge 5 : Write a function divide that takes two natural numbers n and m and returns a boolean indicating if n divides m.
    public func divide(n: Nat, m: Nat) : async Bool {
      return n % m == 0;
    };

    // Challenge 6 : Write a function is_even that takes a natural number n and returns a boolean indicating if n is even.
    public func is_even(n: Nat) : async Bool {
      return n % 2 == 0;
    };

    // Challenge 7 : Write a function sum_of_array that takes an array of natural numbers and returns the sum. This function will returns 0 if the array is empty.
    public func sum_of_array(array : [Nat]) : async Nat {
      var sum = 0;
      for (n in array.vals()) {
        sum += n;
      };
      return sum;
    };

    // Challenge 8 : Write a function maximum that takes an array of natural numbers and returns the maximum value in the array. This function will returns 0 if the array is empty.
    public func maximum(array: [Nat]) : async Nat {
      var max = 0;
      for (n in array.vals()) {
        if (n > max) {
          max := n;
        }
      };
      return max;
    };

    // Challenge 9 : Write a function remove_from_array that takes 2 parameters : an array of natural numbers and a natural number n and returns a new array where all occurences of n have been removed (order should remain unchanged).
    public func remove_from_array(array: [Nat], n: Nat) : async [Nat] {
        return Array.filter(array, func (val : Nat) : Bool {
            return val != n;
        });
    };

    // Challenge 10 : Implement a function selection_sort that takes an array of natural numbers and returns the sorted array .
    public func selection_sort(array : [Nat]) : async [Nat] {
        return Array.sort(array, Nat.compare);
    };

};