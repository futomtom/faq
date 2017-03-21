
import Foundation
class Singleton {
    static let shared = Singleton()
    var value = ""
    private init() { }    //Singleton的init 一定要設為private 原因是 如果是public 那就可以 let b = Singleton()  再創造一個單例
}

let singletonA = Singleton.shared   //因為init() 是private 所以只能透過 shared去拿到單例
singletonA.value = "A"


let singletonB = Singleton.shared

singletonB.value = "B"

singletonA.value == singletonB.value

class Counter {
    
    private static var instance: Counter!
    
    var total: Int
    
    private init(startingWith: Int) {
        total = startingWith
        Counter.instance = self
    }
    
    static func shared(withTotalSetTo total: Int = 0) -> Counter {
        switch instance {
        case let i?:
            i.total = total
            return i
        default:
            instance = Counter(startingWith: total)
            return instance
        }
    }
    
    func increment() -> Counter {
        total += 1
        return self
    }
    
    func reset() -> Counter {
        total = 0
        return self
    }
}

let counterA = Counter.shared()

counterA.total

let counterB = Counter.shared(withTotalSetTo: 10)

counterA.total == counterB.total

counterA.increment().increment().total
