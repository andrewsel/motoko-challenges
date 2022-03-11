import Joke "custom";
import Animal "animal";
import List "mo:base/List"

actor {

    // Challenge 1
    public type Joke = Joke.Joke;
    public func fun() : async Joke {
      let bootcampJoke : Joke = {
        question = "How many Motoko Bootcamp students does it take change a lightbulb?";
        answer = "100. 1 to change the lightbulb, and 99 to ask questions about changing light bulbs in Discord.";
        too_soon = true;
      };
      return bootcampJoke;
    };

    // Challenge 2
    public type Animal = Animal.Animal;
    var animal : Animal = {
      specie = "Crocodile";
      energy = 82;
    };

    // Challenge 3
    public func animal_sleep(animal : Animal) : async Animal {
      return Animal.animal_sleep(animal)
    };

    // Challenge 4
    public func create_animal_then_takes_a_break(specie: Text, energy: Nat) : async Animal {
      let animal : Animal = {
        specie = specie;
        energy = energy;
      };
      let animalAfterSleep = Animal.animal_sleep(animal);
      return animalAfterSleep;
    };

    // Challenge 5
    var animalList = List.nil<Animal>();

    // Challenge 6
    public func push_animal(animal : Animal) : () {
      animalList := List.push<Animal>(animal : Animal, animalList);
      return ();
    };

    public func get_animals() : async [Animal] {
      return List.toArray<Animal>(animalList);
    };

};
