import ShellOut

var dict = Question.getRemoteQuestions()
Question.getLocalInfo(dict: &dict)

Writer.writeReadme(dict, to: readmeURL)
Writer.writeXcodePage(dict, to: helloPageURL)
Tag.allCases.forEach { Writer.writeTag(dict, tag: $0, to: makeURL(tag: $0)) }

print(try shellOut(to: "git", arguments: ["status"]))
print("Commit message: ".yellow, terminator: "")
if let message = readLine() {
    try shellOut(to: "git", arguments: ["add", "-A"])
    try shellOut(to: .gitCommit(message: message))
    try shellOut(to: .gitPush())
    print("Done".green)
} else {
    print("Done without git operations".green)
}

