var dict = Question.getRemoteQuestions()
Question.getLocalInfo(dict: &dict)

Writer.writeReadme(dict, to: readmeURL)
Tag.allCases.forEach { Writer.writeTag(dict, tag: $0, to: makeURL(tag: $0)) }

print("Done".green)
