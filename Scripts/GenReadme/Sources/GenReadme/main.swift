import ShellOut
import Foundation

print("Fetching questions...".yellow)
var dict = Question.getRemoteQuestions()
print("Getting local info...".yellow)
Question.getLocalInfo(dict: &dict)

print("Writing to \(readmeURL.relativeString)...".yellow)
Writer.writeReadme(dict, to: readmeURL)
print("Writing to \(helloPageURL.relativeString)...".yellow)
Writer.writeXcodePage(dict, to: helloPageURL)
print("Writing to Tags...".yellow)
Tag.allCases.forEach {
    Writer.writeTag(dict, tag: $0, to: makeURL(tag: $0))
}

print("\nGit status:".lightBlue)
print(try shellOut(to: "git", arguments: ["status", "-s"]))

signal(SIGINT) { _ in print("\nDone without git operations".green); exit(0); }

print("Commit message: ".yellow, terminator: "")
if let message = readLine() {
    try shellOut(to: "git", arguments: ["add", "-A"])
    print("Commiting...".yellow)
    try shellOut(to: .gitCommit(message: message))
    print("Pushing...".yellow)
    try shellOut(to: .gitPush())
    print("Done".lightGreen)
} else {
    print("\nDone without git operations".green)
}
