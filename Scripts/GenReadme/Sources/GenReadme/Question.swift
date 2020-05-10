//
//  Question.swift
//  GenReadme
//
//  Created by Bugen Zhao on 5/10/20.
//

import Foundation
import SwiftyJSON
import Rainbow

typealias Qid = Int
typealias QuestionDict = [Qid: Question]

struct Question {
    var solved = false
    var solvedPath = ""
    var tags = [Tag]()
    var marked = false
    var line = ""
    var lineForTag = ""

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
                if let qid = Int(page.split(separator: "-")[0]) {
                    dict[qid]?.solved = true
                    dict[qid]?.solvedPath =
                        "\(pagesRelativePath)\(page.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)\("/Contents.swift")"
                    solvedCount += 1

                    let (tags, marked) = Parser.parseTags(pagesURL.appendingPathComponent("\(page)/Contents.swift"))
                    dict[qid]?.tags = tags
                    dict[qid]?.marked = marked
                    if marked { dict[qid]?.difficultyEmoji = difficultyEmojis[0] }
                }
            }
        }

        /// Update line
        dict.forEach { qid, question in
            var line: String
            var lineForTag: String
            
            if question.solved {
                line = "- [X] \(question.difficultyEmoji) [[Q]](https://leetcode.com/problems/\(question.titleSlug)/) [[S]](\(question.solvedPath)) \(String(format: "%04d", qid)). \(question.title) "
                lineForTag = "- [X] \(question.difficultyEmoji) [[Q]](https://leetcode.com/problems/\(question.titleSlug)/) [[S]](../\(question.solvedPath)) \(String(format: "%04d", qid)). \(question.title) "
                let tags = question.tags.drop(while: { $0 == .marked })
                if !tags.isEmpty { line.append("*\(tags)*") }
            } else {
                line = "- [ ] \(question.difficultyEmoji) [[Q]](https://leetcode.com/problems/\(question.titleSlug)/) ~~[S]~~ \(String(format: "%04d", qid)). \(question.title)"
                lineForTag = line
            }

            dict[qid]!.line = line
            dict[qid]!.lineForTag = lineForTag
        }
    }
}
