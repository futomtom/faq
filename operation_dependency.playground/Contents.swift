import Foundation
let queue = OperationQueue()

let completionOperation: BlockOperation = BlockOperation(block: {
    print("completion task done")
})

let workerOperation: BlockOperation = BlockOperation(block: {
    print("worker task done")
})

completionOperation.addDependency(workerOperation)
queue.addOperation(workerOperation)
queue.addOperation(completionOperation)


//: ## output
//: ###  completion task  won't execute until worker done.
/*
 worker task done
 completion task done
 */