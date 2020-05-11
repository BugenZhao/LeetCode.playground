let tags: [Tag] = [.graph]

class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        let color = image[sr][sc]
        guard color != newColor else { return image }
        
        let M = image.count
        let N = image[0].count
        let dirs: [(r: Int, c: Int)] = [(0, -1), (0, 1), (-1, 0), (1, 0)]

        var newImage = image
        var queue = [(r: Int, c: Int)]()
        var head = 0
        queue.append((sr, sc))

        while head != queue.count {
            let (r, c) = queue[head] ; head += 1
            newImage[r][c] = newColor
            dirs.forEach { dir in
                let nr = r + dir.r; let nc = c + dir.c
                if 0..<M ~= nr && 0..<N ~= nc && newImage[nr][nc] == color {
                    queue.append((nr, nc))
                }
            }
        }

        return newImage
    }
}


let f = Solution().floodFill

f([[1, 1, 1], [1, 1, 0], [1, 0, 1]], 1, 1, 2)
f([[1]], 0, 0, 2)
