#!/usr/bin/env python3

import json
import requests
import os
import re

difficulties = [None, '😊', '🤨', '😫']

questions = None
try:
    with open('Scripts/questions.json', 'r') as fp:
        questions = json.load(fp)
except:
    url = 'https://leetcode.com/api/problems/algorithms/'
    questions = json.loads(requests.get(url).content)['stat_status_pairs']
    questions.sort(key=lambda e: e['stat']['question_id'])
    with open('Scripts/questions.json', 'w') as fp:
        json.dump(questions, fp)

lines = []
solved = {}

dirpath = 'LeetCode.playground/Pages/'
for page in os.listdir(dirpath):
    try:
        qid = int(re.sub(r'\D', ' ', page).split()[0])
        path = os.path.join(dirpath, page, 'Contents.swift')
        solved[qid] = path
    except:
        pass

for question in questions:
    qid = question['stat']['question_id']
    difficulty = difficulties[question['difficulty']['level']]
    title = question['stat']['question__title']
    title_slug = question['stat']['question__title_slug']
    if qid in solved:
        line = '- [X] {} [[Q]](https://leetcode.com/problems/{}/) [[S]]({}) {:0>4d}. {}\n' \
            .format(difficulty, title_slug, solved[qid], qid, title)
    else:
        line = '- [ ] {} [[Q]](https://leetcode.com/problems/{}/) ~~[S]~~  {:0>4d}. {}\n' \
            .format(difficulty, title_slug, qid, title)
    lines.append(line)

with open('README.md', 'w') as fp:
    fp.write('# LeetCode.swift\n')
    fp.write("Bugen's LeetCode solutions.\n")
    fp.write('## Problems\n')
    fp.writelines(lines)
