//: idea: Scan all numbers from msb to lsb greedily. If there is a number in form of `1xxx` and `0xxx`, then take both to obtain the maximum result. Note that we should always use the **prefix**, instead of the certain bit. For example,`11xx` and `10xx` reaches `1` on the second significant bit but fail on the msb.

let tags: [Tag] = [.bit, .ON, .greedy]

class Solution {
    func findMaximumXOR(_ nums: [Int]) -> Int {
        var ans = 0
        for i in (0..<Int.bitWidth).reversed() { //: iterate bits
            let prefixes = Set(nums.map { $0 >> i }) //: get prefixes
            ans <<= 1
            if let _ = prefixes.first(where: { p in
                let q = p ^ (ans + 1)
                return prefixes.contains(q)
                //: then `p ^ q = p ^ (p ^ (ans + 1)) = ans + 1`, implying that there exists the pair to obtain a new `1`
            }) { ans += 1 } //: append an `1`
            //: else, append a `0`
        }
        return ans
    }
}


let f = Solution().findMaximumXOR

f([3, 10, 5, 25, 2, 8])
