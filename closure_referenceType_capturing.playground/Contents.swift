//: ### closure capturing when object is reference type. will add reference counter that's why we need to add weak or unwned to self.


import UIKit
class Pet {
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

var pet: Pet = Pet(name: "alex")
let closure = pet.printNameClosure() //pet is reference type , closure will add reference to same instance.
pet.name = "john"
closure()  // since they refer to same instance. so the value changed.

/*
 這次Pet類型為類，是引用類型，因此//1行代碼執行完成後，閉包cl複製了一份變量pet所指向的名為旺旺的Pet實例引用，此時變量pet與閉包cl捕捉的pet指向同一Pet實例，那麼當變量pet所指向的Pet實例改名為強強時，閉包cl所捕捉的Pet實例名字也改為強強
 引用類型變量被捕捉意味著變量所指向的類的引用被覆制，也即引用計數會加一，因此為強持有。
 */
