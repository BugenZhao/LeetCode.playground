//
//  Question.swift
//  GenReadme
//
//  Created by Bugen Zhao on 5/10/20.
//

import Foundation
import Rainbow
import SwiftyJSON

typealias Qid = Int
typealias QuestionDict = [Qid: Question]

struct Question {
    var solved = false
    var solvedPath = ""
    var solvedPagePath = ""
    var tags = [Tag]()
    var date = Date.init(timeIntervalSince1970: 0)

    var qid: Int
    var difficulty: Int
    var title: String
    var titleSlug: String
    var difficultyEmoji: String

    static func getRemoteQuestions() -> QuestionDict {
        var dict = QuestionDict()
        var questions = [JSON]()
        var tryLocal = true

        if let date = try? FileManager.default.attributesOfItem(atPath: localCacheURL.path)[FileAttributeKey.modificationDate] as? Date,
            date.distance(to: Date()) > 7 * 24 * 3600 {
            tryLocal = false
            print("Local cache will be updated".green)
        }

        if tryLocal, let data = try? Data(contentsOf: localCacheURL) {
            questions = JSON(data)["stat_status_pairs"].arrayValue
            if questions.isEmpty { tryLocal = false }
            else { print("Using local cache: \(localCacheURL.relativePath)".green) }
        }

        if !tryLocal {
            let semaphore = DispatchSemaphore(value: 0)
            let task = URLSession.shared.dataTask(with: leetCodeURL!) { (data, _, _) in
                guard let data = data else {
                    fatalError("No LeetCode data".red)
                }
                questions = JSON(data)["stat_status_pairs"].arrayValue
                guard !questions.isEmpty else {
                    fatalError("No LeetCode data".red)
                }

                try? data.write(to: localCacheURL)
                semaphore.signal()
            }
            task.resume()
            semaphore.wait()
        }

        questions.forEach { question in
            let qid = question["stat"]["frontend_question_id"].intValue
            let difficulty = question["difficulty"]["level"].intValue
            let title = question["stat"]["question__title"].stringValue
            let titleSlug = question["stat"]["question__title_slug"].stringValue
            let difficultyEmoji = difficultyEmojis[difficulty]

            dict[qid] = Question(qid: qid, difficulty: difficulty, title: title, titleSlug: titleSlug, difficultyEmoji: difficultyEmoji)
        }

        return dict
    }

    static func getLocalInfo(dict: inout QuestionDict) {
        var solvedCount = 0

        /// Solved
        if let contents = try? fileManager.contentsOfDirectory(atPath: pagesURL.path) {
            contents.forEach { page in
                let split = page.split(whereSeparator: { ["-", "."].contains($0) })
                if !split.isEmpty, let qid = Int(split[0]) {
                    dict[qid]?.solved = true
                    dict[qid]?.solvedPath = "\(pagesRelativePath)\(page.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)\("/Contents.swift")"
                    dict[qid]?.solvedPagePath = String("\(page.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)".dropLast(pageSuffixCount))
                    solvedCount += 1

                    let tags = Parser.parseTags(pagesURL.appendingPathComponent("\(page)/Contents.swift"))
                    dict[qid]?.tags = tags

                    for specialTag in Tag.special {
                        if tags.contains(specialTag) { dict[qid]?.difficultyEmoji = Tag.specialWithEmojis[specialTag]!; break }
                    }

                    if let attr = try? FileManager.default.attributesOfItem(atPath: pagesURL.appendingPathComponent("\(page)").path) {
                        if let date = attr[FileAttributeKey.creationDate] as? Date { dict[qid]?.date = date }
                    }
                }
            }
        }
    }

    func line(with options: FormatOptions = .preset) -> String {
        if solved {
            var line = "- [X] \(difficultyEmoji) [[Q]](https://leetcode.com/problems/\(titleSlug)/) "

            if options.contains(.xcodePath) { line.append("[[S]](\(solvedPagePath)) ") }
            else if options.contains(.tagPath) { line.append("[[S]](../\(solvedPath)) ") }
            else { line.append("[[S]](\(solvedPath)) ") }

            line.append("\(String(format: "%04d", qid)). \(title) ")

            if options.contains(.withTags) {
                let tags = self.tags.filter { !Tag.special.contains($0) }
                if !tags.isEmpty {
                    line.append("*\(tags)*")
                }
            }
            return line
        } else {
            return "- [ ] \(difficultyEmoji) [[Q]](https://leetcode.com/problems/\(titleSlug)/) ~~[S]~~ \(String(format: "%04d", qid)). \(title)"
        }
    }
}
