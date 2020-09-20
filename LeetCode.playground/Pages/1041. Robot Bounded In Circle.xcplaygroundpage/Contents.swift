class Solution {
    func isRobotBounded(_ instructions: String) -> Bool {
        let ds = [(0, 1), (1, 0), (0, -1), (-1, 0)]
        var pos = (0, 0); var dir = 0
        for inst in instructions {
            switch inst {
            case "L":
                dir = (dir + 3) % 4
            case "R":
                dir = (dir + 1) % 4
            default:
                pos.0 += ds[dir].0
                pos.1 += ds[dir].1
            }
        }
        return pos == (0, 0) || dir != 0
    }
}
