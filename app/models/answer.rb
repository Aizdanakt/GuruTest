class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answer_count, on: create

  scope :correct, -> { where(correct: true) }

  private

  def validate_answer_count
    return unless question.answers.count > 3

    errors.add(:base, 'Максимальное количество ответов на один вопрос - 4')
  end
end
