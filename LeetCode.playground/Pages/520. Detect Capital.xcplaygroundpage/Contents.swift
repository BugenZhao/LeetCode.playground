class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        let upper = word.dropFirst().allSatisfy({ $0.isUppercase })
        let lower = word.dropFirst().allSatisfy({ $0.isLowercase })
        return word.first!.isUppercase && (upper || lower) || lower
    }
}

let f = Solution().detectCapitalUse

f("USA")
f("Bugen")
f("hello")
!f("flaG")
!f("FlAg")
