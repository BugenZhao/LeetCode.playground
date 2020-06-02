// Single source shortest paths

let tags: [Tag] = [.graph, .sp]

// Bellman Ford
class SolutionBF {
    func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
        typealias Node = Int
        typealias Weight = Int
        let inf = Weight.max / 3 // avoid overflow

        var adj = [[(node: Node, weight: Weight)]](repeating: [], count: N + 1)
        times.forEach { adj[$0[0]].append((node: $0[1], weight: $0[2])) }

        var dist = [Weight](repeating: inf, count: N + 1)
        dist[K] = 0
        var updated = [Bool](repeating: true, count: N + 1)

        for _ in 1...(N - 1) {
            var newUpdated = [Bool](repeating: false, count: N + 1)
            for u in 1...N {
                guard updated[u] else { continue }
                adj[u].forEach { v, weight in
                    if dist[v] > dist[u] + weight {
                        dist[v] = dist[u] + weight
                        newUpdated[v] = true
                    }
                }
            }
            if newUpdated.allSatisfy({ $0 == false }) { break }
            else { updated = newUpdated }
        }

        let ans = dist.dropFirst().max()! // v = 0 is not used
        return ans == inf ? -1 : ans
    }
}

SolutionBF().networkDelayTime([[2, 1, 1], [2, 3, 1], [3, 4, 1]], 4, 2)
SolutionBF().networkDelayTime([[1, 2, 1]], 2, 2)


// Dijkstra
class SolutionDijkstra {
    func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
        typealias Node = Int
        typealias Weight = Int
        let inf = Weight.max / 3 // avoid overflow

        var adj = [[(node: Node, weight: Weight)]](repeating: [], count: N + 1)
        times.forEach { adj[$0[0]].append((node: $0[1], weight: $0[2])) }

        var dist = [Weight](repeating: inf, count: N + 1)
        dist[K] = 0
        var ok = [Bool](repeating: false, count: N + 1)

        for _ in 1...N {
            // get the not-OK node with minimal dist
            let u = (1...N).lazy.filter({ ok[$0] == false }).min(by: { dist[$0] < dist[$1] })!
            adj[u].forEach { v, weight in
                dist[v] = min(dist[v], dist[u] + weight)
            }
            ok[u] = true
        }

        let ans = dist.dropFirst().max()! // v = 0 is not used
        return ans == inf ? -1 : ans
    }
}

SolutionDijkstra().networkDelayTime([[2, 1, 1], [2, 3, 1], [3, 4, 1]], 4, 2)
SolutionDijkstra().networkDelayTime([[1, 2, 1]], 2, 2)

class SolutionDijkstraPQ {
    func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
        typealias Node = Int
        typealias Weight = Int
        let inf = Weight.max / 3 // avoid overflow

        var adj = [[(node: Node, weight: Weight)]](repeating: [], count: N + 1)
        times.forEach { adj[$0[0]].append((node: $0[1], weight: $0[2])) }

        var dist = [Weight](repeating: inf, count: N + 1)
        dist[K] = 0
        let pq = PriorityQueue<(node: Node, dist: Weight)>(by: { $0.dist < $1.dist })
        pq.enqueue((K, 0))

        while !pq.isEmpty {
            let u = pq.dequeue()!
            if u.dist > dist[u.node] { continue } // out-dated info
            adj[u.node].forEach { v, weight in
                if dist[v] > dist[u.node] + weight  {
                    dist[v] = dist[u.node] + weight
                    pq.enqueue((v, dist[v]))
                }
            }
        }

        let ans = dist.dropFirst().max()! // v = 0 is not used
        return ans == inf ? -1 : ans
    }
}

SolutionDijkstraPQ().networkDelayTime([[2, 1, 1], [2, 3, 1], [3, 4, 1]], 4, 2)
SolutionDijkstraPQ().networkDelayTime([[1, 2, 1]], 2, 2)
