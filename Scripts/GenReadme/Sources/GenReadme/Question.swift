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
    var line = ""
    var lineForTag = ""
    var lineForXcode = ""
    var lineWithDate = ""

    var qid: Int
    var difficulty: Int
    var title: String
    var titleSlug: String
    var difficultyEmoji: String

    static func getRemoteQuestions() -> QuestionDict {
        var dict = QuestionDict()
        var questions = [JSON]()

        let semaphore = DispatchSemaphore(value: 0)
        let task = URLSession.shared.dataTask(with: leetCodeURL!) { (data, _, _) in
            guard let data = data else {
                fatalError("No LeetCode data".red)
            }
            questions = JSON(data)["stat_status_pairs"].arrayValue
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()

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
                let split = page.split(whereSeparator: {["-", "."].contains($0)})
                if !split.isEmpty, let qid = Int(split[0]) {
                    dict[qid]?.solved = true
                    dict[qid]?.solvedPath = "\(pagesRelativePath)\(page.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)\("/Contents.swift")"
                    dict[qid]?.solvedPagePath = String("\(page.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)".dropLast(pageSuffixCount))
                    solvedCount += 1

                    let tags = Parser.parseTags(pagesURL.appendingPathComponent("\(page)/Contents.swift"))
                    dict[qid]?.tags = tags
                    if tags.contains(.marked) { dict[qid]?.difficultyEmoji = difficultyEmojis[0] }
                    if tags.contains(.working) { dict[qid]?.difficultyEmoji = difficultyEmojis[4] }

                    if let attr = try? FileManager.default.attributesOfItem(atPath: pagesURL.appendingPathComponent("\(page)").path) {
                        if let date = attr[FileAttributeKey.creationDate] as? Date { dict[qid]?.date = date }
                    }
                }
            }
        }

        /// Update line
        dict.forEach { qid, question in
            var line: String
            var lineForTag: String
            var lineForXcode: String
            var lineWithDate: String

            if question.solved {
                line = "- [X] \(question.difficultyEmoji) [[Q]](https://leetcode.com/problems/\(question.titleSlug)/) [[S]](\(question.solvedPath)) \(String(format: "%04d", qid)). \(question.title) "
                lineForTag = "- [X] \(question.difficultyEmoji) [[Q]](https://leetcode.com/problems/\(question.titleSlug)/) [[S]](../\(question.solvedPath)) \(String(format: "%04d", qid)). \(question.title) "
                lineForXcode = "- \(question.difficultyEmoji) [[Q]](https://leetcode.com/problems/\(question.titleSlug)/) [[S]](\(question.solvedPagePath)) \(String(format: "%04d", qid)). \(question.title) "
                lineWithDate = "- [X] (\(dateFormatter.string(from: question.date))) \(question.difficultyEmoji) [[Q]](https://leetcode.com/problems/\(question.titleSlug)/) [[S]](\(question.solvedPath)) \(String(format: "%04d", qid)). \(question.title) "

                let tags = question.tags.filter { !Tag.special.contains($0) }
                if !tags.isEmpty {
                    line.append("*\(tags)*")
                    lineForXcode.append("*\(tags)*")
                    lineWithDate.append("*\(tags)*")
                }
            } else {
                line = "- [ ] \(question.difficultyEmoji) [[Q]](https://leetcode.com/problems/\(question.titleSlug)/) ~~[S]~~ \(String(format: "%04d", qid)). \(question.title)"
                lineForTag = line
                lineForXcode = line
                lineWithDate = line
            }

            dict[qid]!.line = line
            dict[qid]!.lineForTag = lineForTag
            dict[qid]!.lineForXcode = lineForXcode
            dict[qid]!.lineWithDate = lineWithDate
        }
    }
}
