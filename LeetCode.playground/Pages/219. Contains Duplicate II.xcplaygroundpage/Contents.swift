let tags: [Tag] = [.hash, .sliding]

class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var occ = [Int: Int]()
        for (i, num) in nums.enumerated() {
            if i > k { occ[nums[i - (k + 1)]]! -= 1 }
            let o = occ[num, default: 0] + 1
            if o > 1 { return true }
            else { occ[num] = o }
        }
        return false
    }
}


class SolutionClear {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var occ = Set<Int>() //: no need to consider times since we are **short-circuit**
        for (i, num) in nums.enumerated() {
            if i > k { occ.remove(nums[i - (k + 1)]) }
            if occ.contains(num) { return true }
            else { occ.insert(num) }
        }
        return false
    }
}
