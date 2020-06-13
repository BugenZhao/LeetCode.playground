let tags: [Tag] = [.bfs]

class Solution {
    func minJumps(_ arr: [Int]) -> Int {
        let N = arr.count

        var indexOf = [Int: [Int]]()
        arr.enumerated().reversed().forEach { indexOf[$1, default: []].append($0) }

        var nextStep = [0]
        var step = 0
        var visited = arr.map { _ in false }

        outer: while !nextStep.isEmpty {
            let thisStep = nextStep
            var head = thisStep.startIndex
            nextStep.removeAll()

            while head < thisStep.endIndex {
                let pos = thisStep[head]; head += 1
                visited[pos] = true
                if pos == N - 1 { break outer }

                if 0..<N ~= pos - 1, !visited[pos - 1] { nextStep.append(pos - 1) }
                if 0..<N ~= pos + 1, !visited[pos + 1] { nextStep.append(pos + 1) }
                indexOf[arr[pos]]?.forEach { npos in if npos != pos, !visited[npos] { nextStep.append(npos) } }
                
                indexOf[arr[pos]] = nil //: MAGIC, avoid looking up again
            }

            step += 1
        }

        return step
    }
}

let f = Solution().minJumps
f([100, -23, -23, 404, 100, 23, 23, 23, 3, 404])
f([0])
f([7, 6, 9, 6, 9, 6, 9, 7])
