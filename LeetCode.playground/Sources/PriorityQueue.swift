public protocol QueueProtocol {
    associatedtype Element

    var size: Int { get }
    mutating func enqueue(_ item: Element) -> Bool
    mutating func dequeue() -> Element?
    func first() -> Element?
    mutating func removeAll()
}

fileprivate extension Int {
    @inline(__always) var leftChild: Int { return self * 2 + 1 }
    @inline(__always) var rightChild: Int { return self * 2 + 2 }
    @inline(__always) var parent: Int { return (self - 1) / 2 }
}

public struct PriorityQueue<Element>: QueueProtocol {
    private var queue = [Element]()

    private mutating func swapElementAt(_ first: Int, _ second: Int) {
        let tmp = queue[first]
        queue[first] = queue[second]
        queue[second] = tmp
    }

    private mutating func heapifyUp(from index: Int) {
        var child = index
        var parent = index.parent

        while child != 0 && lessThan(queue[child], queue[parent]) {
            swapElementAt(parent, child)
            child = parent
            parent = parent.parent
        }
    }

    private mutating func heapifyDown() {
        var parent = 0

        while true {
            let leftChild = parent.leftChild
            let rightChild = parent.rightChild
            guard leftChild < queue.count else { break }
            let minChild = rightChild < queue.count && lessThan(queue[rightChild], queue[leftChild]) ? rightChild : leftChild

            if lessThan(queue[minChild], queue[parent]) {
                swapElementAt(parent, minChild)
                parent = minChild
            } else { break }
        }
    }

    private var lessThan: (Element, Element) -> Bool

    public init(by lessThan: @escaping (Element, Element) -> Bool) {
        self.lessThan = lessThan
    }

    @inline(__always)
    public var size: Int { return self.queue.count }
    @inline(__always)
    public var isEmpty: Bool { return self.queue.isEmpty }

    @discardableResult
    public mutating func enqueue(_ item: Element) -> Bool {
        queue.append(item)
        heapifyUp(from: queue.count - 1)
        return true
    }

    @discardableResult
    public mutating func dequeue() -> Element? {
        guard !queue.isEmpty else { return nil }

        switch queue.count {
        case 1:
            return queue.removeFirst()
        default:
            let item = queue[0]
            queue[0] = queue.removeLast()
            heapifyDown()
            return item
        }
    }

    public func first() -> Element? {
        return queue.first
    }

    public mutating func removeAll() {
        queue.removeAll()
    }
}

extension PriorityQueue: CustomStringConvertible {
    public var description: String {
        return self.queue.description
    }
}
