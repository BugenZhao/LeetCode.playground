import Cocoa
import Foundation
typealias JSONDict = [String: Any]

var questions: [JSONDict] = []
var solved: [Int: String] = [:]
var lines: [Int: String] = [:]

let fileManager = FileManager.default;

let currentURL = URL(fileURLWithPath: fileManager.currentDirectoryPath)
let localCacheURL = URL(fileURLWithPath: "./Scripts/Questions.json", relativeTo: currentURL)
let pagesRelativePath = "./LeetCode.playground/Pages/"
let pagesURL = URL(fileURLWithPath: pagesRelativePath, relativeTo: currentURL)
let leetCodeURL = URL(string: "https://leetcode.com/api/problems/algorithms/")

let semaphore = DispatchSemaphore(value: 0)
let task = URLSession.shared.dataTask(with: leetCodeURL!) { (data, _, _) in
    guard let data = data else {
        fatalError("No data")
    }
    let json = try? JSONSerialization.jsonObject(with: data, options: [JSONSerialization.ReadingOptions.init(rawValue: 0)])
    questions = (json as! JSONDict) ["stat_status_pairs"] as! [JSONDict]
    semaphore.signal()
}
task.resume()
semaphore.wait()


let contents = try? fileManager.contentsOfDirectory(atPath: pagesURL.path)

if let contents = contents {
    for page in contents {
        let qid = Int(page.split(separator: "-")[0])
        if let qid = qid {
            solved[qid] = pagesRelativePath + page
        }
    }
}


for question in questions {
    let stat = question["stat"] as! JSONDict
    let qid = stat["question_id"] as! Int
    let difficulty = (question["difficulty"] as! JSONDict)["level"] as! Int
    let title = stat["question__title"] as! String
    let title_slug = stat["question__title_slug"] as! String

    var difficultyEmoji = ""
    switch difficulty {
    case 1:
        difficultyEmoji = "😊"
    case 2:
        difficultyEmoji = "🤨"
    case 3:
        difficultyEmoji = "😫"
    default:
        fatalError("Invalid difficulty")
    }
    if solved.keys.contains(qid) {
        lines[qid] = "- [X] \(difficultyEmoji) [[Q]](https://leetcode.com/problems/\(title_slug)/) [[S]](\(solved[qid]!)) \(String(format: "%04d", qid)). \(title)\n"
    } else {
        lines[qid] = "- [ ] \(difficultyEmoji) [[Q]](https://leetcode.com/problems/\(title_slug)/) ~~[S]~~ \(String(format: "%04d", qid)). \(title)\n"
    }

}


let readmeURL = URL(fileURLWithPath: "./README.md", relativeTo: currentURL)

var output = ""
output += "# LeetCode.swift\n"
output += "Bugen's LeetCode solutions in Swift.\n"
output += "## Problems\n"
for line in lines.sorted(by: <) {
    output += line.value
}

try output.data(using: String.Encoding.utf8)?.write(to: readmeURL)
