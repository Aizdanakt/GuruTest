class UserPassedTest < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def success_percentage(user_passed_test)
    total_answers = user_passed_test.test.questions.count
    correct_answers = user_passed_test.correct_questions
    success_percentage = ((correct_answers.to_f / total_answers) * 100).to_i
    [success_percentage >= 85 ? 'text-success' : 'text-danger', success_percentage]
  end

  def views_result(result)
    "<h3>Success percentage: <span class=#{result[0]}> #{result[1]} </span></h3>".html_safe
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_validation_set_first_question
    return self.current_question = test.questions.first if new_record?

    self.current_question = next_question
  end
end
