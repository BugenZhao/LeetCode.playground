/*:
 ### Push the Box - BFS/SP/A* Variance
 
 - What's the distance/cost now?
    - Number of steps of the box moving (`step` in code)
    - Not the steps of the player moving
    - Requires a priority queue
 - How can the player move?
    - Just move itself
 - How can the box be moved?
    - The player moving towards and overlapping the box will result in a *push*
    - Not all pushes can be made
 - How to record the visited state?
    - Two states with the same box and player positions are regarded as the same
    - The *cost* of latter one must be larger, which is to discard
 */
let tags: [Tag] = [.graph, .bfs, .marked, .sp]


struct Position: Hashable {
    let x: Int
    let y: Int
}

struct State: Hashable, Equatable {
    let box: Position
    let player: Position
    let step: Int

    //: ignore `step` while checking if visited
    func hash(into hasher: inout Hasher) {
        hasher.combine(box)
        hasher.combine(player)
    }

    //: ignore `step` while checking if visited
    static func == (lhs: State, rhs: State) -> Bool {
        return lhs.box == rhs.box && lhs.player == rhs.player
    }
}


class Solution {
    func minPushBox(_ grid: [[Character]]) -> Int {
        let ds = [(-1, 0), (1, 0), (0, -1), (0, 1)]

        var boxStart: Position?
        var playerStart: Position?

        //: wrap the map with walls
        var wrappedGrid = [[Character]]()
        wrappedGrid.append([Character](repeating: "#", count: grid[0].count + 2))
        for row in grid { wrappedGrid.append(["#"] + row + ["#"]) }
        wrappedGrid.append([Character](repeating: "#", count: grid[0].count + 2))

        //: find the player and the box
        for (i, row) in wrappedGrid.enumerated() {
            for (j, char) in row.enumerated() {
                if char == "S" {
                    playerStart = Position(x: i, y: j)
                    wrappedGrid[i][j] = "."
                } else if char == "B" {
                    boxStart = Position(x: i, y: j)
                    wrappedGrid[i][j] = "."
                }
            }
        }

        //: priority: box moving `step`
        var pq = PriorityQueue<State>(by: { $0.step < $1.step })
        pq.enqueue(State(box: boxStart!, player: playerStart!, step: 0))
        //: visited: `State` without `step`
        var visited = Set<State>()

        var finalState: State?

        while !pq.isEmpty, finalState == nil {
            let state = pq.dequeue()!
            if visited.contains(state) { continue }
            visited.insert(state)

            ds.forEach { dx, dy in
                let playerNew = Position(x: state.player.x + dx, y: state.player.y + dy)
                if wrappedGrid[playerNew.x][playerNew.y] != "#" { //: player moves
                    if playerNew == state.box { //: player overlaps the box, resulting in a `push`
                        let boxNew = Position(x: state.box.x + dx, y: state.box.y + dy)
                        let newState = State(box: boxNew, player: playerNew, step: state.step + 1)
                        switch wrappedGrid[boxNew.x][boxNew.y] { //: can we push the box?
                        case ".": if !visited.contains(newState) { pq.enqueue(newState) }
                        case "T": finalState = newState
                        default: break
                        }
                    } else { //: no push
                        let newState = State(box: state.box, player: playerNew, step: state.step)
                        if !visited.contains(newState) { pq.enqueue(newState) }
                    }
                }
            }
        }

        return finalState?.step ?? -1
    }
}


//: Use two BFS to avoid using of priority queue, one moving player and the other moving box
class SolutionDoubleQueue {
    func minPushBox(_ grid: [[Character]]) -> Int {
        let ds = [(-1, 0), (1, 0), (0, -1), (0, 1)]

        var boxStart: Position?
        var playerStart: Position?

        //: wrap the map with walls
        var wrappedGrid = [[Character]]()
        wrappedGrid.append([Character](repeating: "#", count: grid[0].count + 2))
        for row in grid { wrappedGrid.append(["#"] + row + ["#"]) }
        wrappedGrid.append([Character](repeating: "#", count: grid[0].count + 2))

        //: find the player and the box
        for (i, row) in wrappedGrid.enumerated() {
            for (j, char) in row.enumerated() {
                if char == "S" {
                    playerStart = Position(x: i, y: j)
                    wrappedGrid[i][j] = "."
                } else if char == "B" {
                    boxStart = Position(x: i, y: j)
                    wrappedGrid[i][j] = "."
                }
            }
        }

        //: outer queue, box moving
        var queue = [State]()
        var queueFront = 0
        queue.append(State(box: boxStart!, player: playerStart!, step: 0))
        //: visited: `State` without `step`
        var visited = Set<State>()

        var finalState: State?

        while queueFront < queue.count, finalState == nil {
            let state = queue[queueFront]; queueFront += 1
            if visited.contains(state) { continue }
            visited.insert(state)

            //: inner queue, player moving
            var playerQueue = [Position]()
            var playerQueueFront = 0
            playerQueue.append(state.player)
            var playerVisited = Set<Position>()

            while playerQueueFront < playerQueue.count, finalState == nil {
                let player = playerQueue[playerQueueFront]; playerQueueFront += 1
                if playerVisited.contains(player) { continue }
                playerVisited.insert(player)

                ds.forEach { dx, dy in
                    let playerNew = Position(x: player.x + dx, y: player.y + dy)
                    if wrappedGrid[playerNew.x][playerNew.y] != "#" { //: player moves
                        if playerNew == state.box { //: player overlaps the box, resulting in a `push`, append to outer queue
                            let boxNew = Position(x: state.box.x + dx, y: state.box.y + dy)
                            let newState = State(box: boxNew, player: playerNew, step: state.step + 1)
                            switch wrappedGrid[boxNew.x][boxNew.y] { //: can we push the box?
                            case ".": if !visited.contains(newState) { queue.append(newState) }
                            case "T": finalState = newState
                            default: break
                            }
                        } else { //: no push, append to inner queue
                            if !playerVisited.contains(playerNew) { playerQueue.append(playerNew) }
                        }
                    }
                }
            }
        }

        return finalState?.step ?? -1
    }
}

//: A*
class SolutionAStar {
    func minPushBox(_ grid: [[Character]]) -> Int {
        let ds = [(-1, 0), (1, 0), (0, -1), (0, 1)]

        var boxStart: Position?
        var playerStart: Position?
        var boxDest: Position?

        //: wrap the map with walls
        var wrappedGrid = [[Character]]()
        wrappedGrid.append([Character](repeating: "#", count: grid[0].count + 2))
        for row in grid { wrappedGrid.append(["#"] + row + ["#"]) }
        wrappedGrid.append([Character](repeating: "#", count: grid[0].count + 2))

        //: find the player and the box
        for (i, row) in wrappedGrid.enumerated() {
            for (j, char) in row.enumerated() {
                if char == "S" {
                    playerStart = Position(x: i, y: j)
                    wrappedGrid[i][j] = "."
                } else if char == "B" {
                    boxStart = Position(x: i, y: j)
                    wrappedGrid[i][j] = "."
                } else if char == "T" {
                    boxDest = Position(x: i, y: j)
                }
            }
        }
        
        func heuristic(of box: Position) -> Int {
            return abs(box.x - boxDest!.x) + abs(box.y - boxDest!.y)
        }

        //: priority: heuristic distance to destination
        var pq = PriorityQueue<State>(by: { $0.step + heuristic(of: $0.box) < $1.step + heuristic(of: $1.box) })
        pq.enqueue(State(box: boxStart!, player: playerStart!, step: 0))
        //: visited: `State` without `step`
        var visited = Set<State>()

        var finalState: State?

        while !pq.isEmpty, finalState == nil {
            let state = pq.dequeue()!
            if visited.contains(state) { continue }
            visited.insert(state)

            ds.forEach { dx, dy in
                let playerNew = Position(x: state.player.x + dx, y: state.player.y + dy)
                if wrappedGrid[playerNew.x][playerNew.y] != "#" { //: player moves
                    if playerNew == state.box { //: player overlaps the box, resulting in a `push`
                        let boxNew = Position(x: state.box.x + dx, y: state.box.y + dy)
                        let newState = State(box: boxNew, player: playerNew, step: state.step + 1)
                        switch wrappedGrid[boxNew.x][boxNew.y] { //: can we push the box?
                        case ".": if !visited.contains(newState) { pq.enqueue(newState) }
                        case "T": finalState = newState
                        default: break
                        }
                    } else { //: no push
                        let newState = State(box: state.box, player: playerNew, step: state.step)
                        if !visited.contains(newState) { pq.enqueue(newState) }
                    }
                }
            }
        }

        return finalState?.step ?? -1
    }
}

let f = SolutionDoubleQueue().minPushBox
f([
    ["#", "#", "#", "#", "#", "#"],
    ["#", "T", "#", "#", "#", "#"],
    ["#", ".", ".", "B", ".", "#"],
    ["#", ".", "#", "#", ".", "#"],
    ["#", ".", ".", ".", "S", "#"],
    ["#", "#", "#", "#", "#", "#"]
    ])
f([
    ["#", "#", "#", "#", "#", "#"],
    ["#", "T", "#", "#", "#", "#"],
    ["#", ".", ".", "B", ".", "#"],
    ["#", "#", "#", "#", ".", "#"],
    ["#", ".", ".", ".", "S", "#"],
    ["#", "#", "#", "#", "#", "#"]
    ])
f([
    ["#", "#", "#", "#", "#", "#"],
    ["#", "T", ".", ".", "#", "#"],
    ["#", ".", "#", "B", ".", "#"],
    ["#", ".", ".", ".", ".", "#"],
    ["#", ".", ".", ".", "S", "#"],
    ["#", "#", "#", "#", "#", "#"]
    ])
f([
    ["#", "#", "#", "#", "#", "#", "#"],
    ["#", "S", "#", ".", "B", "T", "#"],
    ["#", "#", "#", "#", "#", "#", "#"]
    ])
f([
    ["#", ".", ".", "#", "#", "#", "#", "#"],
    ["#", ".", ".", "T", "#", ".", ".", "#"],
    ["#", ".", ".", ".", "#", "B", ".", "#"],
    ["#", ".", ".", ".", ".", ".", ".", "#"],
    ["#", ".", ".", ".", "#", ".", "S", "#"],
    ["#", ".", ".", "#", "#", "#", "#", "#"]
    ])
f([
    ["#", "#", "#", "#", "#", "#", "#", "#", "#", "#", "#", "#", "#", "#", "#", "#"],
    ["#", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", "#", "#", "#", "#"],
    ["#", ".", "#", "#", "#", "#", ".", "#", "#", "#", "#", ".", "#", "#", "#", "."],
    ["#", ".", ".", ".", ".", ".", ".", "#", "T", "#", ".", ".", "#", "#", "#", "."],
    ["#", ".", ".", ".", "#", ".", ".", ".", ".", ".", ".", ".", "#", "#", "#", "."],
    ["#", ".", ".", ".", ".", ".", "B", ".", ".", ".", ".", ".", "#", "#", "#", "."],
    ["#", ".", "#", "#", "#", "#", "#", "#", "#", "#", "#", ".", "#", "#", "#", "."],
    ["#", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
    ["#", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
    ["#", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
    ["#", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
    ["#", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
    ["#", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
    ["#", ".", ".", ".", ".", ".", ".", ".", "S", ".", ".", ".", ".", ".", ".", "."],
    ["#", "#", "#", "#", "#", "#", "#", "#", "#", "#", "#", "#", "#", "#", "#", "#"]
    ])
