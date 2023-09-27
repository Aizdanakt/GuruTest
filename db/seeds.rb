# frozen_string_literal: true

# creating categories
basic_category = Category.create!(title: 'basic')
intermediate_category = Category.create!(title: 'intermediate')
advanced_category = Category.create!(title: 'advanced')

# creating users
john = User.create!(name: 'John')
ivan = User.create!(name: 'Ivan')
hans = User.create!(name: 'Hans')

# creating tests
basic_test = Test.create!(title: 'Ruby gems', level: 1, category_id: basic_category.id, user_id: john.id)
intermediate_test = Test.create!(title: 'OOP', level: 2, category_id: intermediate_category.id, user_id: ivan.id)
advanced_test = Test.create!(title: 'SOLID', level: 3, category_id: advanced_category.id, user_id: hans.id)

# creating questions for basic_test
basic_test_question_first = Question.create!(body: 'What task does Device perform?', test_id: basic_test.id)
basic_test_question_second = Question.create!(body: 'What task does Nokogiri perform?', test_id: basic_test.id)
basic_test_question_third = Question.create!(body: 'What task does Draper perform?', test_id: basic_test.id)

# creating questions for intermediate_test
interm_test_question_first = Question.create!(body: 'What does the reusability in OOP mean?', test_id: intermediate_test.id)
interm_test_question_second = Question.create!(body: 'What is Encapsulation in OOP?', test_id: intermediate_test.id)
interm_test_question_third = Question.create!(body: 'What is the advantage of Inheritance in OOP?', test_id: intermediate_test.id)

# creating questions for advanced_test
advanced_test_question_first = Question.create!(body: 'Who came up with the abbreviation SOLID?', test_id: advanced_test.id)
advanced_test_question_second = Question.create!(body: 'What does the principle single responsibility mean?', test_id: advanced_test.id)
advanced_test_question_third = Question.create!(body: 'Entities can change their behavior without changing their
                                                   source code - what is the name of this principle?', test_id: advanced_test.id)

# answer options for basic_test_question_first
Answer.create!(body: 'Extracts information from web pages',
               correct: false, question_id: basic_test_question_first.id)
Answer.create!(body: 'Adds an object-oriented layer of presentation logic to apps.',
               correct: false, question_id: basic_test_question_first.id)
Answer.create!(body: 'Provides an option for authentication',
               correct: true, question_id: basic_test_question_first.id)
Answer.create!(body: 'Allows you to run the server with the power of thought',
               correct: false, question_id: basic_test_question_first.id)

# answer options for basic_test_question_second
Answer.create!(body: 'Extracts information from web pages',
               correct: true, question_id: basic_test_question_second.id)
Answer.create!(body: 'Adds an object-oriented layer of presentation logic to apps.',
               correct: false, question_id: basic_test_question_second.id)
Answer.create!(body: 'Allows you to run the server with the power of thought',
               correct: false, question_id: basic_test_question_second.id)
Answer.create!(body: 'Provides an option for authentication',
               correct: false, question_id: basic_test_question_second.id)

# answer options for basic_test_question_third
Answer.create!(body: 'Provides an option for authentication',
               correct: false, question_id: basic_test_question_third.id)
Answer.create!(body: 'Adds an object-oriented layer of presentation logic to apps.',
               correct: true, question_id: basic_test_question_third.id)
Answer.create!(body: 'Extracts information from web pages',
               correct: false, question_id: basic_test_question_third.id)
Answer.create!(body: 'Allows you to run the server with the power of thought',
               correct: false, question_id: basic_test_question_third.id)


# answer options for interm_test_question_first
Answer.create!(body: 'Allows developers to create code that can be reused in different parts of an application',
               correct: true, question_id: interm_test_question_first.id)
Answer.create!(body: 'Reduces the amount of code that needs to be written and makes it easier to maintain the codebase',
               correct: false, question_id: interm_test_question_first.id)
Answer.create!(body: 'Allows you to automatically get to the interview',
               correct: false, question_id: interm_test_question_first.id)
Answer.create!(body: 'Allows developers to hide the implementation details of objects',
               correct: false, question_id: interm_test_question_first.id)

# answer options for interm_test_question_second
Answer.create!(body: 'Allows developers to hide the implementation details of objects',
               correct: true, question_id: interm_test_question_second.id)
Answer.create!(body: 'Allows developers to create code that can be reused in different parts of an application',
               correct: false, question_id: interm_test_question_second.id)
Answer.create!(body: 'Allows you to automatically get to the interview',
               correct: false, question_id: interm_test_question_second.id)
Answer.create!(body: 'Reduces the amount of code that needs to be written and makes it easier to maintain the codebase',
               correct: false, question_id: interm_test_question_second.id)

# answer options for interm_test_question_third
Answer.create!(body: 'Allows you to automatically get to the interview',
               correct: false, question_id: interm_test_question_third.id)
Answer.create!(body: 'Allows developers to create code that can be reused in different parts of an application',
               correct: false, question_id: interm_test_question_third.id)
Answer.create!(body: 'Allows developers to hide the implementation details of objects',
               correct: false, question_id: interm_test_question_third.id)
Answer.create!(body: 'Reduces the amount of code that needs to be written and makes it easier to maintain the codebase',
               correct: true, question_id: interm_test_question_third.id)


# answer options for advanced_test_question_first
Answer.create!(body: 'Linus Torvalds',
               correct: false, question_id: advanced_test_question_first.id)
Answer.create!(body: 'Yukihiro Matsumoto',
               correct: false, question_id: advanced_test_question_first.id)
Answer.create!(body: 'Robert Martin',
               correct: true, question_id: advanced_test_question_first.id)
Answer.create!(body: 'David Hansson',
               correct: false, question_id: advanced_test_question_first.id)

# answer options for advanced_test_question_second
Answer.create!(body: 'Functions that use the base type should be able to use
                      subtypes of the base type without knowing about it.',
               correct: false, question_id: advanced_test_question_second.id)
Answer.create!(body: 'Denotes that each object should have one duty',
               correct: true, question_id: advanced_test_question_second.id)
Answer.create!(body: 'Clients should not depend on methods they do not use',
               correct: false, question_id: advanced_test_question_second.id)
Answer.create!(body: 'The modules of the upper levels should not depend on the modules of the lower levels',
               correct: false, question_id: advanced_test_question_second.id)

# answer options for advanced_test_question_third
Answer.create!(body: 'Interface segregation principle',
               correct: false, question_id: advanced_test_question_third.id)
Answer.create!(body: 'Open-closed principle',
               correct: true, question_id: advanced_test_question_third.id)
Answer.create!(body: 'Dependency inversion principle',
               correct: false, question_id: advanced_test_question_third.id)
Answer.create!(body: 'Single responsibility principle',
               correct: false, question_id: advanced_test_question_third.id)

# creating passing tests for Users
UserPassedTest.create!(user_id: john.id, test_id: basic_test.id, test_status: 'passing')
UserPassedTest.create!(user_id: john.id, test_id: intermediate_test.id, test_status: 'passing')
UserPassedTest.create!(user_id: john.id, test_id: advanced_test.id, test_status: 'passed')
UserPassedTest.create!(user_id: ivan.id, test_id: basic_test.id, test_status: 'passed')
UserPassedTest.create!(user_id: ivan.id, test_id: intermediate_test.id, test_status: 'passed')
UserPassedTest.create!(user_id: ivan.id, test_id: advanced_test.id, test_status: 'passing')
UserPassedTest.create!(user_id: hans.id, test_id: basic_test.id, test_status: 'passing')
UserPassedTest.create!(user_id: hans.id, test_id: intermediate_test.id, test_status: 'passed')
UserPassedTest.create!(user_id: hans.id, test_id: advanced_test.id, test_status: 'passing')
