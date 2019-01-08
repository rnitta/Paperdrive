# frozen_string_literal: true

module Paperdrive
  class Error < StandardError
    class << self
      def raise_from(response)
        status = response.code
        return if (200..299).cover?(status)

        klass = case status
                when 400      then Paperdrive::BadRequest
                when 400..499 then Paperdrive::ClientError
                when 500 then Paperdrive::InternalServerError
                when 500..599 then Paperdrive::ServerError
                else Paperdrive::UnknownError
                end
        # FIXME
        raise klass, response.code
      end
    end
  end

  class AuthorizationNotSpecified < Error; end
  class ClientError < Error; end
  class BadRequest < ClientError; end
  class ServerError < Error; end
  class InternalServerError < ServerError; end
  class UnknownError < Error; end
end
