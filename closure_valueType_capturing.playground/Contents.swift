//!!! closure value capturing
import UIKit
struct Pet {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    func printNameClosure() -> () -> Void {
        return {
            print(self.name)
        }
    }
}

var pet: Pet = Pet(name: "Alex")
let closure = pet.printNameClosure() //closure make a copy of pet and it's name is Alex
pet.name = "John"
closure()
