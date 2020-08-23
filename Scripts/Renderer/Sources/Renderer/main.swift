import Foundation
import ShellOut
import ArgumentParser

struct Options: ParsableArguments {
    @Option(help: "LeetCode API URL")
    var leetCodeURLString = "https://leetcode.com/api/problems/algorithms/"
}

let options = Options.parseOrExit()
leetCodeURL = URL(string: options.leetCodeURLString)

dateFormatter.dateFormat = "MM-dd"

print("Fetching questions...".yellow)
var dict = Question.getRemoteQuestions()
print("Getting local info...".yellow)
Question.getLocalInfo(dict: &dict)
let contestList = Contest.getList()

print("Writing...".yellow)
Writer.writeReadme(dict, contestList, to: readmeURL)
Writer.writeXcodePage(dict, to: helloPageURL)
Tag.allCases.forEach {
    Writer.writeTag(dict, tag: $0, to: makeURL(tag: $0))
}

print("\nGit status:".lightBlue)
print(try shellOut(to: "git", arguments: ["status", "-s"]))

signal(SIGINT) { _ in print("\nDone without git operations".green); exit(0) }

print("Commit message: ".yellow, terminator: "")
if let message = readLine() {
    let child = Process()
    child.executableURL = URL(fileURLWithPath: "/usr/bin/qlmanage")
    child.arguments = ["-p", readmeURL.path]
    child.standardOutput = FileHandle.nullDevice
    child.standardError = FileHandle.nullDevice
    child.launch()

    try shellOut(to: "git", arguments: ["add", "-A"])
    print("Commiting...".yellow)
    try shellOut(to: .gitCommit(message: message))
    print("Pushing...".yellow)
    try shellOut(to: .gitPush())
    print("Done".lightGreen)
} else {
    print("\nDone without git operations".green)
}
