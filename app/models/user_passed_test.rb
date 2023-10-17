class UserPassedTest < ApplicationRecord
  SUCCESS_RATIO = 85

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
    test_result(((correct_answers.to_f / total_answers) * 100).to_i)
  end

  private

  def test_result(success_percentage)
    [SUCCESS_RATIO, success_percentage]
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == if answer_ids.nil?
                                  false
                                else
                                  answer_ids.map(&:to_i).sort
                                end
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_validation_set_first_question
    self.current_question = if new_record?
                              test.questions.first
                            else
                              next_question
                            end
  end
end
