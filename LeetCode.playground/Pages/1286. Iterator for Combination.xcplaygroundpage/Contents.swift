let tags: [Tag] = [.bit]

final class CombinationIterator {
    var current: UInt
    let end: UInt
    let chars: [Character]
    let combLen: Int

    init(_ characters: String, _ combinationLength: Int) {
        chars = Array(characters)
        combLen = combinationLength
        current = ((1 << combLen) - 1) << (chars.count - combLen) + 1
        end = ((1 << combLen) - 1)
    }

    func next() -> String {
        repeat { current -= 1 } while current.nonzeroBitCount != combLen
        return String(chars.indices.reversed().filter { current & (1 << $0) != 0 }.map { chars[chars.count - $0 - 1] })
    }

    func hasNext() -> Bool {
        return current != end
    }
}

let it = CombinationIterator("abcde", 2)
(0..<10).map { _ in
    (it.hasNext(), it.next(), it.current)
}
it.hasNext()
