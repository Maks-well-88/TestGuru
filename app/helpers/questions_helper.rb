module QuestionsHelper
  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def question_header(question)
    question.persisted? ? "Edit #{@question.test.title} Question" : "Create New #{@question.test.title} Question"
  end
end
