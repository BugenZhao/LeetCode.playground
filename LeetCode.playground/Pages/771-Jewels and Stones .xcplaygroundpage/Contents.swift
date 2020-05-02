class Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        let setJ = Set<Character>(J.map { $0 })
        return S.reduce(0) { r, c in return setJ.contains(c) ? r + 1 : r }
    }
}

let f = Solution().numJewelsInStones

f("aA", "aAAbbbb")
f("z", "ZZ")
