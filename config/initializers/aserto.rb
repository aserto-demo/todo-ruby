# frozen_string_literal: true

require "aserto/rails"

Aserto.configure do |config|
  config.policy_id = ENV.fetch("POLICY_ID", nil)
  config.tenant_id = ENV.fetch("ASERTO_TENANT_ID", nil)
  config.authorizer_api_key = ENV.fetch("ASERTO_AUTHORIZER_API_KEY", nil)
  config.policy_root = "peoplefinder"
  config.service_url = "authorizer.eng.aserto.com:8443"
  config.decision = "allowed"
  config.logger = Rails.logger
  config.identity_mapping = {
    type: :sub,
    from: :sub
  }
end