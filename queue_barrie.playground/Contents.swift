import Foundation
let queue = DispatchQueue.global()

queue.async { //task1
    for _ in 0...3 {
        print("......")
    }
}
queue.async { //task2
    for _ in 0...2 {
        print("++++++");
    }
}

// barrier 会等待上面执行完毕再执行下面的，会阻塞当前线程
queue.async(flags: .barrier, execute: { //2.
    print("will wait for above tasks finished, make a barrier here.")
})

queue.async {
    print("111111")
}


