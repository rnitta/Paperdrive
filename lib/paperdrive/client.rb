# frozen_string_literal: true

require 'active_support'
require 'active_support/core_ext'
require 'faraday'
require 'faraday_middleware'
require 'paperdrive/error'
require 'paperdrive/parameters'
require 'paperdrive/response'
require 'paperdrive/client/activities'
require 'paperdrive/client/activity_fields'
require 'paperdrive/client/activity_types'
require 'paperdrive/client/currencies'
require 'paperdrive/client/deals'
require 'paperdrive/client/deal_fields'
require 'paperdrive/client/notes'
require 'paperdrive/client/note_fields'

module Paperdrive
  # Client to aceess API
  class Client
    include Paperdrive::Client::Activities
    include Paperdrive::Client::ActivityFields
    include Paperdrive::Client::ActivityTypes
    include Paperdrive::Client::Currencies
    include Paperdrive::Client::Deals
    include Paperdrive::Client::DealFields
    include Paperdrive::Client::Notes
    include Paperdrive::Client::NoteFields

    API_BASEURL = 'https://api.pipedrive.com/v1'

    # build instances by<br>
    # using arguments: pass the token as `token:`<br>
    # or using environment variables: set the token to ENV['PAPERDRIVE_TOKEN']
    #
    # @param [String] token: Paperdrive API access token
    # @return [Paperdrive::Client] instance
    def initialize(token: nil)
      token ||= ENV['PAPERDRIVE_TOKEN']
      raise Paperdrive::AuthTokenNotSpecified unless token || token.is_a?(String)

      @token = token
    end

    # masking tokens to prevent casually displaying tokens
    #
    # @return [String] inspected and token masked string
    def inspect
      inspected = super
      inspected.gsub!(@token, 'MASKED_TOKEN') if @token
    end

    protected

    # make crud request
    def request(method, path, params)
      raise Paperdrive::InvalidRequestMethod unless %i[get post put delete].include?(method.to_sym)

      raw_response = connection.send(method, build_path(path), params)
      Paperdrive::Response.new(raw_response)
    end

    private

    # memonize Faraday connection
    def connection
      @connection ||= Faraday.new(url: API_BASEURL) do |faraday|
        faraday.request :json
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
      end
    end

    # build path which has `api_token:` query param
    def build_path(path)
      "#{path}?#{{ api_token: @token }.to_query}"
    end
  end
end
