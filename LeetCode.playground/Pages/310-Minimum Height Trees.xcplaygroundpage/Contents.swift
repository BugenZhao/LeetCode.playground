/*:
 ### Find min height trees
 Aka., find the center(s) of the tree. Just keep removing the leaves and there will be 1 or 2 centers left.
 */
let tags: [Tag] = [.tree, .marked]

class Solution {
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        if edges.isEmpty { return [0] }

        var adj = [Set<Int>](repeating: [], count: n)
        edges.forEach {
            adj[$0[0]].insert($0[1])
            adj[$0[1]].insert($0[0])
        }
        var rem = n

        var leaves = (0..<n).filter { adj[$0].count == 1 }
        while rem > 2 {
            var newLeaves = [Int]()
            leaves.forEach { leaf in
                let other = adj[leaf].first!
                adj[other].remove(leaf)
                //: KEY: the new leaves will only appears in these vertices (`other`s)
                if adj[other].count == 1 { newLeaves.append(other) }
            }
            rem -= leaves.count
            leaves = newLeaves
        }

        return leaves
    }
}

let f = Solution().findMinHeightTrees

f(4, [[1, 0], [1, 2], [1, 3]])
f(6, [[0, 3], [1, 3], [2, 3], [4, 3], [5, 4]])
