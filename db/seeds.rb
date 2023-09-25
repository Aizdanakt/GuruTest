# frozen_string_literal: true

answers = [
  { body: 'answer_1', correct: false },
  { body: 'answer_2', correct: false },
  { body: 'answer_3', correct: false }
]
categories = [
  { title: 'category_1' },
  { title: 'category_2' },
  { title: 'category_3' }
]
questions = [
  { body: 'question_1' },
  { body: 'question_2' },
  { body: 'question_3' }
]
tests = [
  { title: 'test_1', level: 2 },
  { title: 'test_2', level: 3 },
  { title: 'test_3', level: 3 }
]
users = [
  { name: 'Name_1' },
  { name: 'Name_2' },
  { name: 'Name_3' }
]

users_id = []
categories_id = []
tests_id = []
questions_id = []

users.each do |line|
  users_id << User.create!(line).id
end

categories.each do |line|
  categories_id << Category.create!(line).id
end

tests.each do |line|
  tests_id << Test.create!(title: line[:title], level: line[:level],
                           category_id: categories_id.pop, user_id: users_id.pop).id
end

questions.each do |line|
  questions_id << Question.create!(body: line[:body], test_id: tests_id.pop).id
end

answers.each do |line|
  Answer.create!(body: line[:body], correct: line[:correct], question_id: questions_id.pop)
end
