module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end
  class PasswordMismatch < StandardError; end
  class UnauthorizedUser < StandardError; end
  class EmailNotSent < StandardError; end
  class InvalidParams < StandardError; end

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthenticated
    rescue_from ExceptionHandler::MissingToken, with: :record_invalid
    rescue_from ExceptionHandler::InvalidToken, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ExceptionHandler::UnauthorizedUser, with: :unauthorized_request
    rescue_from ExceptionHandler::InvalidParams, with: :record_invalid
  end

  def record_invalid(error)
    json_error_response(status: :unprocessable_entity, message: error.message, errors: error.message)
  end

  def unauthenticated(error)
    json_error_response(status: :unauthorized, message: error.message, errors: error.message)
  end

  def unauthorized_request(error)
    json_error_response(status: :forbidden, message: error.message, errors: error.message)
  end

  def record_not_found(error)
    json_error_response(status: :not_found, message: error.message, errors: error.message)
  end

  def password_not_matching_confirmation(error)
    json_error_response(status: :unprocessable_entity, message: error.message, errors: error.message)
  end

  def email_not_sent(error)
    json_error_response(status: :unprocessable_entity, message: error.message, errors: error.message)
  end
end
