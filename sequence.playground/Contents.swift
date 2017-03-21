import Foundation
let binarySequence = sequence(first: 1, next: { $0 * 2 })

for x in binarySequence.prefix(3) {
    print(x)
}

let firstEvenNumber = [1, 3, 4, 6].first { $0 % 2 == 0 }

print(firstEvenNumber ?? "No even numbers in array")


