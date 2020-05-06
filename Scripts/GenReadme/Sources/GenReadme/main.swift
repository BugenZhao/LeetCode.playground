import Cocoa
import Foundation
import SwiftyJSON

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
let difficultyEmojis = ["🔞", "😊", "🤨", "😫"]
let swiftVersion = "5.2"


var questions = [JSON]()
var solved = [Int: String]()
var lines = [Int: String]()
var starred = Set<Int>()

let fileManager = FileManager.default;

let currentURL = URL(fileURLWithPath: fileManager.currentDirectoryPath)
let localCacheURL = URL(fileURLWithPath: "./Scripts/GenReadme/Questions.json", relativeTo: currentURL)
let pagesRelativePath = "./LeetCode.playground/Pages/"
let pagesURL = URL(fileURLWithPath: pagesRelativePath, relativeTo: currentURL)
let leetCodeURL = URL(string: "https://leetcode.com/api/problems/algorithms/")


let semaphore = DispatchSemaphore(value: 0)
let task = URLSession.shared.dataTask(with: leetCodeURL!) { (data, _, _) in
    guard let data = data else {
        fatalError("No data")
    }
    questions = JSON(data)["stat_status_pairs"].arrayValue
    semaphore.signal()
}
task.resume()
semaphore.wait()


if let contents = try? fileManager.contentsOfDirectory(atPath: pagesURL.path) {
    for page in contents {
        if let qid = Int(page.split(separator: "-")[0]) {
            solved[qid] = pagesRelativePath + page.replacingOccurrences(of: " ", with: "%20") + "/Contents.swift"
            if page.hasSuffix("-D.xcplaygroundpage") { starred.insert(qid) }
        }
    }
}


var solvedCount = 0

for question in questions {
    let qid = question["stat"]["frontend_question_id"].intValue
    let difficulty = question["difficulty"]["level"].intValue
    let title = question["stat"]["question__title"].stringValue
    let title_slug = question["stat"]["question__title_slug"].stringValue
    let difficultyEmoji = starred.contains(qid) ? "🔞" : difficultyEmojis[safe: difficulty] ?? "🔞"
    if solved.keys.contains(qid) {
        solvedCount += 1
        lines[qid] = "- [X] \(difficultyEmoji) [[Q]](https://leetcode.com/problems/\(title_slug)/) [[S]](\(solved[qid]!)) \(String(format: "%04d", qid)). \(title)\n"
    } else {
        lines[qid] = "- [ ] \(difficultyEmoji) [[Q]](https://leetcode.com/problems/\(title_slug)/) ~~[S]~~ \(String(format: "%04d", qid)). \(title)\n"
    }
}


let readmeURL = URL(fileURLWithPath: "./README.md", relativeTo: currentURL)

var output = ""
output += "# LeetCode.swift\n"
output += "![Language](https://img.shields.io/badge/Language-Swift%20\(swiftVersion)-orange.svg)\n"
output += "![Progress](https://img.shields.io/badge/Progress-\(solvedCount)%20%2F%20\(lines.count)%20=%20\(String(format: "%.2f", 100.0 * Double(solvedCount) / Double(lines.count)))%25-orange.svg)\n\n"
output += "Bugen's LeetCode solutions in Swift playground.\n"
output += "## Problems\n"
for line in lines.sorted(by: <) {
    output += line.value
}

try output.data(using: String.Encoding.utf8)?.write(to: readmeURL)

