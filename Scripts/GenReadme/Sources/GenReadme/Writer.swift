//
//  Writer.swift
//  GenReadme
//
//  Created by Bugen Zhao on 5/10/20.
//

import Foundation

class Writer {
    @discardableResult
    static func writeReadme(_ dict: QuestionDict, to url: URL) -> Bool {
        let count = dict.count
        let solvedCount = dict.filter(\.value.solved).count

        var output = ""
        output += "# LeetCode.playground\n"
        output += "![Language](https://img.shields.io/badge/Language-Swift%20\(swiftVersion)-orange.svg)\n"
        output += "![Progress](https://img.shields.io/badge/Progress-\(solvedCount)%20%2F%20\(count)%20=%20\(String(format: "%.2f", 100.0 * Double(solvedCount) / Double(count)))%25-orange.svg)\n\n"
        output += "Bugen's LeetCode solutions in Swift Playground.\n"

        output += "\n## Tags\n"
        Tag.allCases.forEach { tag in
            output += "- [\(tag)](\(makePath(tag: tag, urlAllowed: true)))\n"
        }

        output += "\n## Problems\n"

        dict.filter(\.value.solved)
            .sorted(by: { lhs, rhs in return lhs.key < rhs.key })
            .map(\.value.line)
            .forEach { output += $0 + "\n" }

        output += "\n<details>\n<summary>Todo</summary>\n\n"
        dict.filter { $0.value.solved == false }
            .sorted(by: { lhs, rhs in return lhs.key < rhs.key })
            .map(\.value.line)
            .forEach { output += $0 + "\n" }
        output += "</details>\n"

        output += "\n## How am I generated?\n"
        output += "Based on *SwiftSyntax*, the generator walks through the directories and analyzes the syntax of each solution to fetch its metadata.\n\nFor example, it can collect the tag info if the following statement appears in the solution:\n\n"
        output += "```swift\nlet tags: [Tag] = [.marked, .dp, .graph]\n```\n\n"
        output += "For more details, check [here](./Scripts/GenReadme/)!"


        do { try output.data(using: String.Encoding.utf8)?.write(to: url) }
        catch { return false }
        return true
    }

    @discardableResult
    static func writeTag(_ dict: QuestionDict, tag: Tag, to url: URL) -> Bool {
        let count = dict.count
        let solvedCount = dict.filter(\.value.solved).count

        var output = ""
        output += "# LeetCode.playground\n"
        output += "![Language](https://img.shields.io/badge/Language-Swift%20\(swiftVersion)-orange.svg)\n"
        output += "![Progress](https://img.shields.io/badge/Progress-\(solvedCount)%20%2F%20\(count)%20=%20\(String(format: "%.2f", 100.0 * Double(solvedCount) / Double(count)))%25-orange.svg)\n\n"
        output += "Bugen's LeetCode solutions in Swift Playground.\n"

        output += "## \(tag) Problems\n"
        let lines = dict.filter({ $0.value.tags.contains(tag) }).sorted(by: { lhs, rhs in return lhs.key < rhs.key }).map(\.value.lineForTag)
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
            .sorted(by: { lhs, rhs in return lhs.key < rhs.key })
            .map(\.value.lineForXcode)
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
