module QuestionsHelper
  def question_header(question)
    question.new_record? ? "Create New #{@test.title} Question" : "Edit #{question.test.title} Question"
  end

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'TestGuru', "https://github.com/#{author}/#{repo}", target: '_blank'
  end
end
