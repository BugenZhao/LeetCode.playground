//
//  Writer.swift
//  GenReadme
//
//  Created by Bugen Zhao on 5/10/20.
//

import Foundation

class Writer {
    @discardableResult
    static func writeReadme(_ dict: QuestionDict, _ contests: ContestList, to url: URL) -> Bool {
        let count = dict.count

        let solved = dict.filter(\.value.solved)
        let solvedCount = solved.count + contests.map(\.questionCount).reduce(0, +)
        let difficultySolvedCount = (1...3).map { d in solved.filter { $1.difficulty == d }.count }
        let difficulties = ["Easy", "Medium", "Hard"]
        let difficultyColors = ["74b566", "e7af5f", "ca5c54"]

        var output = ""
        output += "# LeetCode.playground\n"
        output += languageBadge
        output += "![Progress](https://img.shields.io/badge/Progress-\(solvedCount)%20%2F%20\(count)%20=%20\(String(format: "%.2f", 100.0 * Double(solvedCount) / Double(count)))%25-orange.svg)\n"
        for i in 0..<3 {
            output += "![\(difficulties[i])](https://img.shields.io/badge/\(difficulties[i])-\(difficultySolvedCount[i])-\(difficultyColors[i]).svg)\n"
        }

        output += "\n"
        output += "```swift\n\(intro)\n```\n\n"

        output += "\n## Tags\n"
        let tags = Tag.allCases.sorted { lhs, rhs in
            dict.filter({ $0.value.tags.contains(lhs) }).count >
            dict.filter({ $0.value.tags.contains(rhs) }).count }
        func writeTagEntry(_ tag: Tag) {
            output += "- [\(tag)](\(makePath(tag: tag, urlAllowed: true)))\n"
        }
        if tags.count <= 10 {
            tags.forEach(writeTagEntry)
        } else {
            tags.prefix(10).forEach(writeTagEntry)
            output += "\n<details>\n<summary>More</summary>\n\n"
            tags[10...].forEach(writeTagEntry)
            output += "</details>\n"
        }

        output += "\n## Recent\n"
        dict.sorted(by: { lhs, rhs in lhs.value.date > rhs.value.date })
            .prefix(10)
            .map { $0.value.line() }
            .forEach { output += $0 + "\n" }

        output += "\n## Contests\n"
        contests.sorted(by: { lhs, rhs in lhs.title > rhs.title })
            .map { $0.line() }
            .forEach { output += $0 + "\n" }

        output += "\n## Problems\n"

        dict.filter(\.value.solved)
            .sorted(by: { lhs, rhs in lhs.key < rhs.key })
            .map { $0.value.line() }
            .forEach { output += $0 + "\n" }

        output += "\n<details>\n<summary>Todo</summary>\n\n"
        dict.filter { $0.value.solved == false }
            .sorted(by: { lhs, rhs in lhs.key < rhs.key })
            .map { $0.value.line() }
            .forEach { output += $0 + "\n" }
        output += "</details>\n"

        output += "\n## How am I generated?\n"
        output += "Based on *SwiftSyntax*, the renderer walks through the directories and analyzes the syntax of each solution to fetch its metadata.\n\nFor example, it can collect the tag info if the following statement appears in the solution:\n\n"
        output += "```swift\nlet tags: [Tag] = [.marked, .dp, .graph]\n```\n\n"
        output += "For more details, check [here](./Scripts/Renderer/)!"


        do { try output.data(using: String.Encoding.utf8)?.write(to: url) }
        catch { return false }
        return true
    }

    @discardableResult
    static func writeTag(_ dict: QuestionDict, tag: Tag, to url: URL) -> Bool {
        let filteredDict = dict.filter({ $0.value.tags.contains(tag) }).sorted(by: { lhs, rhs in return lhs.key < rhs.key })
        let count = filteredDict.count

        var output = ""
        output += "# LeetCode.playground\n"
        output += languageBadge
        output += "![Progress](https://img.shields.io/badge/Count-\(count)-orange.svg)\n\n"
        output += "Bugen's LeetCode solutions in Swift Playground.\n"

        output += "## \(tag) Problems\n"
        let lines = Tag.special.contains(tag) ?
        filteredDict.map { $0.value.line(with: [.tagPath, .withTags]) }:
            filteredDict.map { $0.value.line(with: [.tagPath]) }
        if lines.isEmpty { output += "*[No solution yet]*\n" }
        else { lines.forEach { output += $0 + "\n" } }

        do { try output.data(using: String.Encoding.utf8)?.write(to: url) }
        catch { return false }
        return true
    }

    @discardableResult
    static func writeXcodePage(_ dict: QuestionDict, to url: URL) -> Bool {
        let count = dict.count
        let solvedCount = dict.filter(\.value.solved).count

        var output = "/*:\n"
        output += "# LeetCode.playground\n"
        output += "Bugen's LeetCode solutions in Swift Playground.\n\n"
        output += "> Progress: \(solvedCount) / \(count) = \(String(format: "%.2f", 100.0 * Double(solvedCount) / Double(count)))%\n"

        output += "\n## Problems\n"

        dict.filter(\.value.solved)
            .sorted(by: { lhs, rhs in lhs.key < rhs.key })
            .map { $0.value.line(with: [.xcodePath, .withTags]) }
            .forEach { output += $0 + "\n" }

        output += "*/\n\n"
        output += #"""
        var array = ["Swift", "Playground", "LeetCode", "Bugen! 😄"]
        array.forEach { print("Hello, \($0)") }
        """#


        do { try output.data(using: String.Encoding.utf8)?.write(to: url) }
        catch { return false }
        return true
    }
}
