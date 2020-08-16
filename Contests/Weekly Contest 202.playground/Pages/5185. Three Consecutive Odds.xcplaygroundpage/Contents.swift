class Solution {
    func threeConsecutiveOdds(_ arr: [Int]) -> Bool {
        if arr.count < 3 { return false }
        let arr1 = arr.dropFirst()
        let arr2 = arr1.dropFirst()
        return zip(arr, zip(arr1, arr2)).contains { $0 % 2 == 1 && $1.0 % 2 == 1 && $1.1 % 2 == 1 }
    }
}

let f = Solution().threeConsecutiveOdds

f([1, 2, 34, 3, 4, 5, 7, 23, 12])
f([2, 6, 4, 1])
f([1, 3])
f([1, 3, 5])
f([1, 3, 4])
