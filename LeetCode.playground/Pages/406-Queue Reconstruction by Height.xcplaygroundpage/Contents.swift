/*:
 - Arrange people from the highest to the shortest, since the join of shorter people does not influence the higher ones.
 - For people with the same height, the ***relative*** order among them is decided by `people[i][1]`, and should be kept all the times.
 - When we are dealing with `people[i][1] == j`, it implies that the person should be inserted at the `j`-th position at present, since he is the shortest one now and height of every one ahead of him should be larger or equal to him.
 */
let tags: [Tag] = [.greedy, .sort, .marked]

class Solution {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        let people = people.sorted(by: { lhs, rhs in
            lhs[0] == rhs[0] ? (lhs[1] < rhs[1]) : (lhs[0] > rhs[0])
        })
        var queue = [[Int]]()
        people.forEach { queue.insert($0, at: $0[1]) }
        return queue
    }
}

Solution().reconstructQueue([[7, 0], [4, 4], [7, 1], [5, 0], [6, 1], [5, 2]])
