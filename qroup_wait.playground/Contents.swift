import Foundation

let myQueue = DispatchQueue.global()
let group = DispatchGroup()
myQueue.async(group: group, qos: .default, flags: [], execute: {
    for _ in 0...5 {
        print("heavy task 1")
        sleep(1)
    }
})
myQueue.async(group: group, qos: .default, flags: [], execute: {
    for _ in 0...5 {
        print("heavy task 2")
        sleep(1)
    }
})

let result = group.wait(timeout: .now() + 2.0)
//let result = group.wait(timeout: .distantFuture)  //uncomment this to see differnt result.
switch result {
case .success:
    print("above tasks done.")
case .timedOut:
    print("time out, no wait any more.let's do something 上面的任务还没执行完执行这了")
}

print("another task")
