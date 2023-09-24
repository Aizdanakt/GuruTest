# frozen_string_literal: true

answers = [
  { body: 'answer_1', correct: false, question_id: 1 },
  { body: 'answer_2', correct: false, question_id: 3 },
  { body: 'answer_3', correct: false, question_id: 1 }
]
categories = [
  { title: 'category_1' },
  { title: 'category_2' },
  { title: 'category_3' }
]
questions = [
  { body: 'question_1', test_id: 2 },
  { body: 'question_2', test_id: 1 },
  { body: 'question_3', test_id: 3 }
]
tests = [
  { title: 'test_1', level: 2, category_id: 1, user_id: 3 },
  { title: 'test_2', level: 3, category_id: 2, user_id: 3 },
  { title: 'test_3', level: 3, category_id: 1, user_id: 1 }
]
users = [
  { name: 'Name_1' },
  { name: 'Name_2' },
  { name: 'Name_3' }
]

users.each { |line| User.create(line) }
categories.each { |line| Category.create(line) }
tests.each { |line| Test.create(line) }
questions.each { |line| Question.create(line) }
answers.each { |line| Answer.create(line) }
