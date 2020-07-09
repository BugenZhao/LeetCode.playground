let tags: [Tag] = [.dp, .marked, .bit]

class Solution {
    func findIntegers(_ num: Int) -> Int {
        typealias Pair = (cons: Int, any: Int) //: whether the count is under `<=` constraint
        var ichi = [Pair]() //: count under `bit[i] == 1`
        var zero = [Pair]() //: count under `bit[i] == 0`
        if num & 1 > 0 {
            ichi.append((cons: 1, any: 1))
            zero.append((cons: 1, any: 1))
        } else {
            ichi.append((cons: 0, any: 1))
            zero.append((cons: 1, any: 1))
        }

        for i in 1..<64 {
            if num & (1 << i) > 0 { // 1X...
                ichi.append((cons: zero[i - 1].cons, // 10...
                             any:  zero[i - 1].any)) // 10...
                zero.append((cons: ichi[i - 1].any + zero[i - 1].any,  // 01... 00...
                             any:  ichi[i - 1].any + zero[i - 1].any)) // 01... 00...
            } else { // 0X...
                ichi.append((cons: 0,
                             any:  zero[i - 1].any)) // 10...
                zero.append((cons: ichi[i - 1].cons + zero[i - 1].cons, // 01... 00...
                             any:  ichi[i - 1].any + zero[i - 1].any))  // 01... 00...
            }
        }
        
        return ichi.last!.cons + zero.last!.cons
    }
}

let f = Solution().findIntegers

f(5)
f(1)
