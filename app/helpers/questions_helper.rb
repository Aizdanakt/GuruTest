module QuestionsHelper
  def question_header(action)
    action == 'new' ? 'Create New Test' : 'Edit Test'
  end

  def current_year
    Time.now.year
  end

  def github_url
    link_to 'TestGuru', 'https://github.com/Aizdanakt/TestGuru'
  end
end
