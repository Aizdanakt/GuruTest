# frozen_string_literal: true

require 'octokit'

class GistQuestionService
  Response = Struct.new(:html_url, :id)

  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    response = @client.create_gist(gist_params)
    return unless success?(response)

    create_response(response.html_url, response.id)

  end

  private

  def success?(response)
    response.html_url.present? && response.id.present?
  end

  def create_response(html_url, id)
    Response.new(html_url, id)
  end

  def gist_params
    {
      description: I18n.t('services.gist_params.gist', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  def default_client
    Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'])
  end

end
