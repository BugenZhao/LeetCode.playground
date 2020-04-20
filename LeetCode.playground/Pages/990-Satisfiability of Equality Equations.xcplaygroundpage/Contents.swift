class Solution {
    func equationsPossible(_ equations: [String]) -> Bool {
        var id = [Character: Character]()

        func find(_ item: Character) -> Character {
            guard id.keys.contains(item) else {
                id[item] = item
                return item
            }
            var item = item
            while item != id[item] { item = id[item]! }
            return item
        }
        func union(_ lhs: Character, _ rhs: Character) {
            let lRoot = find(lhs)
            let rRoot = find(rhs)
            guard lRoot != rRoot else { return }
            id[lRoot] = rRoot
        }

        for equation in equations.lazy.filter({ !$0.contains("!") }) {
            let lhs = equation.first!
            let rhs = equation.last!
            union(lhs, rhs)
        }

        for equation in equations.lazy.filter({ $0.contains("!") }) {
            if find(equation.first!) == find(equation.last!) { return false }
        }

        return true
    }
}

testEqual(Solution().equationsPossible(["a==b", "b!=a"]), false)
testEqual(Solution().equationsPossible(["a==b", "b==c", "c==a"]), true)
testEqual(Solution().equationsPossible(["x==y"]), true)
