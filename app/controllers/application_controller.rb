# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from StandardError do |exception|
    Rails.logger.error exception.backtrace.inspect if Rails.env.development?

    render json: { error: exception.message }, status: :internal_server_error
  end

  private
end
