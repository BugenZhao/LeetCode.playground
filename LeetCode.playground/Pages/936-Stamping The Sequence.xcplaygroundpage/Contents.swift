/*:
 Back track.
 
 ```
 aabcaca, []
 a****ca, [1]
 *****ca, [1, 0]
 *******, [1, 0, 3]
 
 [3, 0, 1]
 ```
 */
let tags: [Tag] = [.greedy]

func ~= (pattern: ArraySlice<Character>, rhs: ArraySlice<Character>) -> Bool {
    guard pattern.count == rhs.count else { return false }
    for (a, b) in zip(pattern, rhs) {
        if a != "*", a != b { return false }
    }
    return true
}

class Solution {
    func movesToStamp(_ stamp: String, _ target: String) -> [Int] {
        let stamp = ArraySlice(stamp); let n = stamp.count
        var target = Array(target); let N = target.count
        var stars = 0
        var answers = [Int]()

        var replaced = [Bool](repeating: false, count: N - n + 1)
        while stars < N {
            guard let toReplace = (0..<N - n + 1).first(where: { !replaced[$0] && target[$0..<$0 + n] ~= stamp })
                else { return [] }
            for i in toReplace..<toReplace + n where target[i] != "*" {
                target[i] = "*"
                stars += 1
            }
            replaced[toReplace] = true
            answers.append(toReplace)
        }

        return answers.reversed()
    }
}


let f = Solution().movesToStamp

f("abc", "ababc")
f("abca", "aabcaca")
f("bb", "bugen")
