# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from Aserto::AccessDenied do |exception|
    render json: { error: exception.message }, status: :unauthorized
  end

  rescue_from StandardError do |exception|
    Rails.logger.error exception.backtrace.inspect if Rails.env.development?

    render json: { error: exception.message }, status: :internal_server_error
  end
end
