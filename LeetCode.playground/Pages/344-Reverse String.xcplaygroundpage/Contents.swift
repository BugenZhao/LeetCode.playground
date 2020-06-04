class Solution {
    func reverseString(_ s: inout [Character]) {
        for i in 0..<s.count / 2 { s.swapAt(i, s.count - 1 - i) }
    }
}

let f = Solution().reverseString

var bugen = Array("bugen")
f(&bugen)

var foobar = Array("foobar")
f(&foobar)
