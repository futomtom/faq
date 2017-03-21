
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
func delay(for seconds: Int, action: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + Double(seconds)) { action() }
}

struct Person {
    let name: String
    lazy var beCreated = Date()
    var now = Date()

    init(name: String) {
        self.name = name
    }
}

var alex = Person(name: "alex")
delay(for: 5) {
    print("Now:", alex.now)
    print("lazy variable: ", alex.beCreated)
}


/*  
 Now: 2017-02-19 00:23:37 +0000          37sec
 Lazy variable:  2017-02-19 00:23:42 +0000    42sec //lazy 是第一次要access時,才被creat出來的
 */