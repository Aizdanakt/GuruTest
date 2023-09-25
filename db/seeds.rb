# frozen_string_literal: true

# arrays with SEEDs to add to tables
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
tests_id = []
questions_id = []

# adding data to tables and getting their identifiers
users_id = User.create!(users).pluck(:id)
categories_id = Category.create!(categories).pluck(:id)

tests_id << Test.create!(title: tests[0][:title], level: tests[0][:level],
                         category_id: categories_id.pop, user_id: users_id.pop).id
tests_id << Test.create!(title: tests[1][:title], level: tests[1][:level],
                         category_id: categories_id.pop, user_id: users_id.pop).id
tests_id << Test.create!(title: tests[2][:title], level: tests[2][:level],
                         category_id: categories_id.pop, user_id: users_id.pop).id

questions_id << Question.create!(body: questions[0][:body], test_id: tests_id.pop).id
questions_id << Question.create!(body: questions[1][:body], test_id: tests_id.pop).id
questions_id << Question.create!(body: questions[2][:body], test_id: tests_id.pop).id

Answer.create!(body: answers[0][:body], correct: answers[0][:correct], question_id: questions_id.pop)
Answer.create!(body: answers[1][:body], correct: answers[1][:correct], question_id: questions_id.pop)
Answer.create!(body: answers[2][:body], correct: answers[2][:correct], question_id: questions_id.pop)
