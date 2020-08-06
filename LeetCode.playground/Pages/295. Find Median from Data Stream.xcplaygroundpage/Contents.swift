let tags: [Tag] = [.heap, .marked]

class MedianFinder {
    var lo = PriorityQueue<Int>(by: >)
    var hi = PriorityQueue<Int>(by: <)

    func addNum(_ num: Int) {
        hi.enqueue(num)
        lo.enqueue(hi.dequeue()!) //: ensure that `hi.first >= lo.first`
        if lo.count > hi.count {
            hi.enqueue(lo.dequeue()!)
        } //: ensure that `0...1 ~= hi.count - lo.count`
    }

    func findMedian() -> Double {
        return hi.count == lo.count ?
            Double(hi.first! + lo.first!) / 2.0:
            Double(hi.first!)
    }
}


let finder = MedianFinder()
[-1, -2, -3].map { (num: Int) -> Double in
    finder.addNum(num)
    return finder.findMedian()
}

