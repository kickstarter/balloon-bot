require './core/entities/incident'
require './core/entities/message'
require './persistence/incidents_repository'
require './types'
require './clients/slack/slack_message'
require './clients/github/status'

class HoldDeployments
  attr_reader :chat_client, :incidents_repository, :github_client

  def initialize(
    chat_client:,
    incidents_repository: IncidentsRepository.new,
    github_client: GithubClientWrapper.new
  )
    @chat_client = chat_client
    @incidents_repository = incidents_repository
    @github_client = github_client
  end

  def execute(request)
    if incidents_repository.find_last_unresolved
      chat_client.say(message: SlackClientWrapper::ERROR_MESSAGES[:already_holding])
      return
    end

    chat_client.say(message: SlackClientWrapper::FAILURE_MESSAGE)
    chat_client.set_channel_topic(message: SlackClientWrapper::FAILURE_CHANNEL_TOPIC)

    github_client.open_pull_requests.each do |pull_request|
      github_client.set_status_for_commit(
        commit_sha: pull_request.head_sha,
        status: Github::Status.failure,
        more_info_url: chat_client.url_for(message: request.triggered_by)
      )
    end

    incidents_repository.save(Incident.new)
  end

  class Request < Dry::Struct
    attribute :triggered_by, Types.Instance(SlackMessage)
  end
end
