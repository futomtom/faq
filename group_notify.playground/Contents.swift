//: will be notified when tasks finish.

import Foundation
let queue = DispatchQueue.global()
let group = DispatchGroup()
queue.async(group: group, execute: {
    for _ in 0...3 {
        print("task1")
        usleep(100)
    }
})
queue.async(group: group, execute: {
    for _ in 0...3 {
        print("task2")
        usleep(100)
    }
})

group.notify(queue: queue) {
    print("the above tasks finished")
}

/* output
 task1
 task2
 task1
 task2
 task2
 task1
 task2
 task1
 the above tasks finished
 */