# frozen_string_literal: true

module Paperdrive
  # Error Class
  class Error < StandardError
    class << self
      # raise errors which corresponding to response status code
      #
      # @param [Paperdrive::Client] response
      def raise_from(response)
        status = response.status
        return if (200..299).cover?(status)

        klass = case status
                when 400 then Paperdrive::BadRequest
                when 401 then Paperdrive::Unauthorized
                when 429 then Paperdrive::RateLimitExceeded
                when 400..499 then Paperdrive::ClientError
                when 500 then Paperdrive::InternalServerError
                when 500..599 then Paperdrive::ServerError
                else Paperdrive::UnknownError
                end
        raise klass, "#{status}-#{response&.reason_phrase}"
      end
    end
  end

  # response-relateds
  class ClientError < Error; end
  class BadRequest < ClientError; end
  class Unautorized < ClientError; end
  class RateLimitExceeded < ClientError; end
  class ServerError < Error; end
  class InternalServerError < ServerError; end
  class UnknownError < Error; end

  # others
  class AuthTokenNotSpecified < Error; end
  class InvalidRequiredParameters < Error; end
  class MissingRequiredParameters < Error; end
  class InvalidRequestMethod < Error; end
end
