let tags: [Tag] = [.tree, .dfs, .string, .binSearch]

final class SubFolderTrie {
    var token: String
    var children = [String: SubFolderTrie]()
    var isEnd = false

    init(_ token: String) {
        self.token = token
    }
}

class Solution {
    func removeSubfolders(_ folder: [String]) -> [String] {
        let root = SubFolderTrie("")
        for path in folder {
            var node = root
            for token in path.split(separator: "/").map({ String($0) }) {
                if let next = node.children[token] { node = next }
                else {
                    let new = SubFolderTrie(token)
                    node.children[token] = new
                    node = new
                }
            }
            node.isEnd = true
        }

        var results = [String]()
        func dfs(_ node: SubFolderTrie, _ path: String) {
            if node.isEnd { results.append(path) }
            else {
                for (token, child) in node.children {
                    dfs(child, path + "/" + token)
                }
            }
        }
        dfs(root, "")
        return results
    }
}

let f = Solution().removeSubfolders
f(["/a", "/a/b", "/c/d", "/c/d/e", "/c/f"])
f(["/a", "/a/b/c", "/a/b/d"])

//: Approach 2: sort in lexicographical order
class SolutionEfficient {
    func removeSubfolders(_ folder: [String]) -> [String] {
        let folder = folder.sorted()
        var results = [String]()
        var index = folder.startIndex
        while index != folder.endIndex {
            results.append(folder[index])
            let sub = folder[index] + "/"
            guard let next = (index + 1..<folder.endIndex).firstIndex(where: { !folder[$0].starts(with: sub) }) else { break }
            index = next
        }
        return results
    }
}

let g = SolutionEfficient().removeSubfolders
g(["/a", "/a/b", "/c/d", "/c/d/e", "/c/f"])
g(["/a", "/a/b/c", "/a/b/d"])


//: Approach 3: sort by length, binary search
