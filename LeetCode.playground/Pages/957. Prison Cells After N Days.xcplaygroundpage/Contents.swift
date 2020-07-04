let tags: [Tag] = [.hash]

class Solution {
    func prisonAfterNDays(_ cells: [Int], _ N: Int) -> [Int] {
        guard N >= 1 else { return cells }
        var cells = cells
        var step = [cells: 0]
        var arcStep = [cells]
        for i in 1...N {
            var newCells = cells
            newCells[0] = 0; newCells[7] = 0
            for i in 1...6 {
                newCells[i] = cells[i - 1] == cells[i + 1] ? 1 : 0
            }

            if let j = step[newCells] {
                let n = (N - j) % (i - j) + j
                return arcStep[n]
            } else {
                step[newCells] = i
                arcStep.append(newCells)
                cells = newCells
            }
        }
        return arcStep.last!
    }
}

let f = Solution().prisonAfterNDays

f([0, 1, 0, 1, 1, 0, 0, 1], 7)
f([1, 0, 0, 1, 0, 0, 1, 0], 1000000000)
