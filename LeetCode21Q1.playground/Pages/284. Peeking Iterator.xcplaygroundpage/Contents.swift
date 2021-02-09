class PeekingIterator {
    var arr: IndexingIterator<Array<Int>>
    var a: Int?
    var b: Int?

    init(_ _arr: IndexingIterator<Array<Int>>) {
        arr = _arr
        a = arr.next()
        b = arr.next()
    }

    func next() -> Int {
        let ret = a
        (a, b) = (b, arr.next())
        return ret!
    }

    func peek() -> Int {
        return a!
    }

    func hasNext() -> Bool {
        return a != nil
    }
}
