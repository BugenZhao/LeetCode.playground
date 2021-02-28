let tags: [Tag] = [.ON, .stack]

class Solution {
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        var stack = [Int]()
        var seen = Set<Int>()
        
        var it = pushed.makeIterator()
        
        for e in popped {
            while !seen.contains(e) {
                if let n = it.next() {
                    stack.append(n)
                    seen.insert(n)
                }
                else { break }
            }
            
            if stack.last == e { stack.popLast() }
            else { break }
        }
        
        return stack.isEmpty
    }
}
