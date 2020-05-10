var dict = Question.getRemoteQuestions()
Question.getLocalInfo(dict: &dict)

Writer.writeReadme(dict, to: readmeURL)
Writer.writeXcodePage(dict, to: helloPageURL)
Tag.allCases.forEach { Writer.writeTag(dict, tag: $0, to: makeURL(tag: $0)) }

print("Done".green)
