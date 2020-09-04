let tags: [Tag] = [.string, .math]

class Solution {
    func largestTimeFromDigits(_ A: [Int]) -> String {
        if A.allSatisfy({ $0 == 0 }) { return "00:00" }
        var ans = 0
        
        for i in A.indices {
            for j in A.indices where i != j {
                let hour = A[i] * 10 + A[j]
                guard hour <= 23 else { continue }
                var B = A; B[i] = 0; B[j] = 0; B.sort(by: >); B.removeLast(2)
                let _ = [B, B.reversed()].forEach {
                    let min = $0[0] * 10 + $0[1]
                    guard min <= 59 else { return }
                    ans = max(ans, hour * 60 + min)
                }
            }
        }
        
        return ans == 0 ? "" : "\(String(format: "%02d", ans / 60)):\(String(format: "%02d", ans % 60))"
    }
}


let f = Solution().largestTimeFromDigits

f([1, 2, 3, 4])
f([2, 3, 6, 0])
f([2, 4, 0, 0])
f([0, 6, 2, 6])
