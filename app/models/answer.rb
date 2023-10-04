class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :test_validate

  def test_validate
    return unless question.answers.count > 3

    errors.add(:base, 'Максимальное количество ответов на один вопрос - 4')

  end
end
