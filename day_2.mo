// Motoko Bootcamp Day 2 Challenges

import Nat "mo:base/Nat";
import Array "mo:base/Array";
import Nat8 "mo:base/Nat8";
import Float "mo:base/Float";
import Text "mo:base/Text";
import Result "mo:base/Result";
import Char "mo:base/Char";

actor {

    // Challenge 1
    type Error = {
        #TooBig;
    };

    public func nat_to_nat8(n: Nat) : async Result.Result<Nat8, Error> {
        if (n > 255) {
            return #err(#TooBig);
        };
        #ok(Nat8.fromNat(n));
    };

    // Challenge 2
    public func max_number_with_n_bits(n: Nat) : async Nat {
        return ((2 ** (n - 1)) * 2) - 1;
    };

    // Challenge 3
    public func decimal_to_bits(n: Float) : async Text {
        var num : Float = n / 2;
        var rem : Float = n % 2;
        let bits : Float = Float.floor(num) + 1;
        var binaryString : Text = "";
        if (num >= 1) {
            binaryString := "1";
        } else {
            return "0"
        };
        var i : Float = 0;
        while (i < (bits - 1)) {
            if (rem == 0) {
                binaryString := Text.concat(binaryString, "0");
            } else {
                binaryString := Text.concat(binaryString, "1");
            };
            rem := rem % 2;
            i += 1;
        };
        return binaryString;
    };

    // Challenge 4
    public func capitalize_character(c: Char) : async Char {
      var charNat32 : Nat32 = Char.toNat32(c);
      if (charNat32 >= 97 and charNat32 <= 122) {
        charNat32 -= 32;
        return Char.fromNat32(charNat32);
      } else {
        return Char.fromNat32(charNat32);
      };
    };

    // Challenge 5
    public func capitalize_text(t: Text) : async Text {
      var string = "";
      for (char in Text.toIter(t)) {
        var cc : Char = await capitalize_character(char);
        string := string # Text.fromChar(cc);
      };
      return string;
    };

    // Challenge 6
    public func is_inside(t: Text, c: Char) : async Bool {
      for (char in Text.toIter(t)) {
        if (char == c) {
          return true;
        }
      };
      return false;
    };


    // Challenge 7
    public func trim_whitespace(t: Text) : async Text {
      var string = "";
      var trimmedStart : Bool = false;
      for (char in Text.toIter(t)) {
        if (Char.toNat32(char) != 32 or trimmedStart == true) {
          string := string # Text.fromChar(char);
          trimmedStart := true;
        }
      };
      return string;
    };


    // Challenge 8
    public func duplicated_character(t: Text) : async Text {
      var nondupLetters = "";
      for (char in Text.toIter(t)) {
        if (await is_inside(nondupLetters, char)) {
          return Text.fromChar(char);
        } else {
          nondupLetters := nondupLetters # Text.fromChar(char);
        }
      };
      return t;
    };


    // Challenge 9
    public func size_in_bytes(t: Text) : async Nat {
      return t.size();
    };


    // Challenge 10
    public func bubble_sort(array : [Nat]) : async [Nat] {
        return Array.sort(array, Nat.compare);
    };

};