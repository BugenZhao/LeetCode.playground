// A variation of Floyd Warshall

let tags: [Tag] = [.graph, .sp]

class SolutionFloyd {
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var quot = [String: [String: Double]]()
        for (equ, val) in zip(equations, values) {
            quot[equ[0], default: [:]][equ[1]] = val
            quot[equ[1], default: [:]][equ[0]] = 1.0 / val
            quot[equ[0]]![equ[0]] = 1.0
            quot[equ[1]]![equ[1]] = 1.0
        }

        for k in quot.keys { // k as an intermediary
            for i in quot.keys {
                for j in quot.keys {
                    if let ik = quot[i]![k], let kj = quot[k]![j] {
                        quot[i]![j] = ik * kj
                    }
                }
            }
        }

        return queries.map { quot[$0[0]]?[$0[1]] ?? -1.0 }
    }
}

SolutionFloyd().calcEquation([["a", "b"], ["b", "c"]], [2.0, 3.0], [["a", "c"], ["b", "a"], ["a", "e"], ["a", "a"], ["x", "x"]])
SolutionFloyd().calcEquation([], [], [["x", "y"]])

