import Foundation

public protocol QueueProtocol {
    associatedtype Element

    var size: Int { get }
    @discardableResult func enqueue(_ item: Element) -> Bool
    @discardableResult func dequeue() -> Element?
    func first() -> Element?
    func removeAll()
}

fileprivate extension Int {
    var leftChild: Int { return self * 2 + 1 }
    var rightChild: Int { return self * 2 + 2 }
    var parent: Int { return (self - 1) / 2 }
}

public class PriorityQueue<Element>: QueueProtocol {
    private var queue = [Element]()

    private func swapElementAt(_ first: Int, _ second: Int) {
        let tmp = queue[first]
        queue[first] = queue[second]
        queue[second] = tmp
    }

    private func heapifyUp(from index: Int) {
        var child = index
        var parent = index.parent

        while child != 0 && lessThan(queue[child], queue[parent]) {
            swapElementAt(parent, child)
            child = parent
            parent = parent.parent
        }
    }

    private func heapifyDown() {
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

    public var size: Int { return self.queue.count }
    public var isEmpty: Bool { return self.queue.isEmpty }

    @discardableResult public func enqueue(_ item: Element) -> Bool {
        queue.append(item)
        heapifyUp(from: queue.count - 1)
        return true
    }

    @discardableResult public func dequeue() -> Element? {
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

    public func removeAll() {
        queue.removeAll()
    }
}

extension PriorityQueue: CustomStringConvertible {
    public var description: String {
        return self.queue.description
    }
}
