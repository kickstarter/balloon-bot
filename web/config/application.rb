require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"
require "olive_branch"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Web
  FETCH_INCIDENTS = ::Core::IncidentAnalysis::FetchIncidents.new(
    incidents_repository: ::Persistence::INCIDENTS_REPOSITORY,
    incidents_analyzer: ::Core::IncidentAnalysis::IncidentTermsAnalyzer.new(
      text_analyzer: ::Clients::DataAnalysis::TfIdfTermsAnalyzer.new
    )
  )
  FETCH_MESSAGES_FOR_INCIDENT = ::Core::IncidentAnalysis::FetchMessagesForIncident.new(
    messages_repository: ::Persistence::MESSAGES_REPOSITORY,
    chat_client: ::Clients::SLACK_CLIENT_WRAPPER
  )
  CALCULATE_LIFETIME_INCIDENT_STATS = ::Core::IncidentAnalysis::CalculateLifetimeIncidentStats.new(
    incidents_repository: ::Persistence::INCIDENTS_REPOSITORY,
  )
  CALCULATE_INCIDENT_STATS_OVER_TIME = ::Core::IncidentAnalysis::CalculateIncidentStatsOverTime.new(
    incidents_repository: ::Persistence::INCIDENTS_REPOSITORY,
  )

  class Application < Rails::Application
    config.load_defaults 5.1
    config.api_only = true
    config.middleware.use ::OliveBranch::Middleware
  end
end
