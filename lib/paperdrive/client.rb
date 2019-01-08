# frozen_string_literal: true

require 'paperdrive/client/general'
require 'paperdrive/client/activities'

module Paperdrive
  class Client
    include Paperdrive::Client::General
    include Paperdrive::Client::Activities

    def initialize(options = {})
      token = options[:token] || ENV['PAPERDRIVE_TOKEN']
      raise Paperdrive::AuthorizationNotSpecified if token.empty?

      Paperdrive.instance_variable_set(:@token, token)
    end
  end
end
