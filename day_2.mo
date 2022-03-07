// Motoko Bootcamp Day 2 Challenges

import Nat8 "mo:base/Nat8";
import Float "mo:base/Float";
import Text "mo:base/Text";
import Result "mo:base/Result";

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
        while (i < bits) {
            if (rem == 0) {
                binaryString := Text.concat(binaryString, "0");
            } else {
                binaryString := Text.concat(binaryString, "1");
            };
            rem := rem % 2;
        };
        return binaryString;
    };

};