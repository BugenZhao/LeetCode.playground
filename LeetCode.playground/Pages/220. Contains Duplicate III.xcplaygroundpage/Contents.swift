let tags: [Tag] = [.hash, .sliding]

class Solution {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        guard t >= 0 else { return false }
        
        let nums = nums.map{ $0 - Int(Int32.min) }
        typealias Bucket = Int
        var occBucket = [Bucket: Int]()
        for (i, num) in nums.enumerated() {
            let b = num / (t + 1)
            if i > k { occBucket.removeValue(forKey: nums[i - (k + 1)] / (t + 1)) }
            
            if let _ = occBucket[b] { return true }
            if let nei = occBucket[b - 1], abs(nei - num) <= t { return true }
            if let nei = occBucket[b + 1], abs(nei - num) <= t { return true }
            occBucket[b] = num
        }
        return false
    }
}


Solution().containsNearbyAlmostDuplicate([-3, 3], 2, 4)
