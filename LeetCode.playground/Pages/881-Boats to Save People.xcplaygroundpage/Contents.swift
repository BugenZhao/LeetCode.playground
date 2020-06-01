let tags: [Tag] = [.greedy, .twoPtrs]

class Solution {
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        let people = people.sorted(by: >)
        var num = 0

        //: match a heavy guy and a thin one
        var heavy = people.startIndex
        var thin = people.endIndex - 1
        while heavy < thin {
            if people[heavy] + people[thin] <= limit {
                heavy += 1
                thin -= 1
            } else {
                heavy += 1
            }
            num += 1
        }

        return num + (heavy == thin ? 1 : 0)
    }
}

let f = Solution().numRescueBoats

f([3, 5, 3, 4], 5)
f([3, 2, 2, 1], 3)
f([1, 1, 1, 3, 3, 3], 4)
f([1, 3, 3], 4)
f([3], 5)
