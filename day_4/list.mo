actor {

    public type List<T> = ?(T, List<T>);

    // Challenge 7
    public func is_null(l : List<T>) : async Bool {
      switch(l){
        case(null) {
          return false
        };
        case(?list){
          return true
        };
      };
    };

    // Challenge 8
    public func last(l : List<T>) : async ?T {
      var lastElement : ?T = null;
      switch(l){
        case(null) {
          return lastElement;
        };
        case(?list){
          last(?list);
        };
      };
    };

    // Challenge 9
    public func size(l : List<T>) : async Nat {
      var length = 0;
      switch(l){
        case(null) {
          return length;
        };
        case(?list){
          length += 1;
        };
      };
    };

    // Challenge 10
    public func get(l : List<T>, n : Nat) : async ?T {
      var position = 1;
      switch(l){
        case(null) {
          return null;
        };
        case(?list) {
          if (n == position) {
            return l;
          } else {
            position += 1;
            get(?list);
          }
        };
      };
    };

};
