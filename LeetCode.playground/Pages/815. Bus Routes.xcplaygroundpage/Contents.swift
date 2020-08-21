let tags: [Tag] = [.bfs]

class Solution {
    func numBusesToDestination(_ routes: [[Int]], _ S: Int, _ T: Int) -> Int {
        let routes = routes.map { Array(Set($0)) }
        var routesOf = [Int: [Int]]()
        for (routeIdx, route) in routes.enumerated() {
            for stop in route {
                routesOf[stop, default: []].append(routeIdx)
            }
        }

        var queue = [(stop: S, level: 0)]
        var routeVisited = Set<Int>()
        var index = queue.startIndex
        while index != queue.endIndex {
            let (stop, level) = queue[index]; index += 1
            if stop == T { return level }

            guard let nextRoutes = routesOf[stop] else { continue }
            for nextRoute in nextRoutes where !routeVisited.contains(nextRoute) {
                for nextStop in routes[nextRoute] {
                    queue.append((nextStop, level + 1))
                }
                routeVisited.insert(nextRoute)
            }
        }

        return -1
    }
}


let f = Solution().numBusesToDestination

f([[1, 2, 7], [3, 6, 7]], 1, 6)
f([[1, 2, 7], [3, 6, 7]], 1, 2)
f([[1, 2, 7], [3, 6, 7]], 1, 1)
f([[1, 2, 7], [3, 6, 7], [100, 101, 102]], 1, 100)
f([[1, 2, 7], [3, 6, 7], [100, 101, 102]], 1, 500)

let tc = TestCase("huge.in")!
f(tc.next()!, tc.next()!, tc.next()!)
