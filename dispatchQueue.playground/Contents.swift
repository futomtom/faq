//: Playground - noun: a place where people can play

import UIKit


let serialQueue: DispatchQueue = DispatchQueue(label: "com.alex")
let concurrentQueue: DispatchQueue = DispatchQueue(label: "com.alex2", attributes: .concurrent)

serialQueue.async {
    print("1")
}

serialQueue.async {
    usleep(1000)
    print("2")
}

serialQueue.async {
    print("3")
}
serialQueue.async {
    print("4")
}



concurrentQueue.async {
    print("a")
}

concurrentQueue.async {
    usleep(1000)
    print("b")
}

concurrentQueue.async {
    print("c")
}
concurrentQueue.async {
    print("d")
}



