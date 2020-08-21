let tags: [Tag] = [.array]

class Solution {
    let map: [Character: String] = [
        "2": "abc",
        "3": "def",
        "4": "ghi",
        "5": "jkl",
        "6": "mno",
        "7": "pqrs",
        "8": "tuv",
        "9": "wxyz",
    ]

    func letterCombinations(_ digits: String) -> [String] {
        var ans = [""]
        for c in digits where c != "1" {
            ans = map[c]!.flatMap { letter in ans.map { $0 + "\(letter)" } }
        }
        return ans.count == 1 ? [] : ans
    }
}


let f = Solution().letterCombinations

f("123")
f("12")
f("1111")
f("23456")
