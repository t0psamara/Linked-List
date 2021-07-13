/*
 Algorithm             ArrayList   LinkedList
 
 seek front            O(1)        O(1)
 seek back             O(1)        O(1)
 seek to index         O(1)        O(N)
 insert at front       O(N)        O(1)
 insert at back        O(1)        O(1)
 insert after an item  O(N)        O(1)
 */

struct LinkedList<T> where T: Hashable {

    var head: LinkedListNode<T>
    
    private var nodes: Set<LinkedListNode<T>>
    
    init(head: LinkedListNode<T>) {
        self.head = head
        self.nodes = [head]
    }
}

indirect enum LinkedListNode<T> {
    case value(element: T, next: LinkedListNode<T>)
    case end
}

extension LinkedList: Sequence {
    
    func makeIterator() -> LinkedListIterator<T> {
        return LinkedListIterator(current: head)
    }
}

struct LinkedListIterator<T>: IteratorProtocol {
    var current: LinkedListNode<T>
    
    mutating func next() -> T? {
        switch current {
        case let .value(element, next):
            current = next
            return element
        case .end:
            return nil
        }
    }
}

// MARK: - EXTENSIONS

extension LinkedList {
    var count: Int {
        var counter: Int = 0
        for _ in self {
            counter += 1
        }
        return counter
    }
}

extension LinkedListNode: Hashable, Equatable where T: Hashable & Equatable {
    
}





extension LinkedList: Equatable where T: Equatable {
    static func == (lhs: LinkedList<T>, rhs: LinkedList<T>) -> Bool {
        lhs.elementsEqual(rhs) { lhs, rhs in
            lhs == rhs
        }
    }
    
    
    
}

// MARK: - EXAMPLE

let element1 = LinkedListNode.value(element: "A", next: .end)

var list1 = LinkedList(head: element1)

print(list1.count)

let arr: [Int] = []

list1
 
let element4 = LinkedListNode.value(element: "D", next: .end)
let element3 = LinkedListNode.value(element: "C", next: element4)
let element2 = LinkedListNode.value(element: "B", next: element3)
