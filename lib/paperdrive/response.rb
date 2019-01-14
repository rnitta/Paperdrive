# frozen_string_literal: true

require 'paperdrive/error'

module Paperdrive
  # Wrapper class of the Faraday::Response.
  class Response
    attr_accessor :header, :ratelimit, :body, :status_code, :status_phrase

    # build instance from Faraday::Response
    #
    # @param [Faraday::Response] response
    def initialize(response)
      Paperdrive::Error.raise_from(response)
      @header = response.headers.to_h
      @ratelimit = build_ratelimit(@header)
      @body = JSON.parse(response.body)
      @status_code = response.status
      @status_phrase = response.reason_phrase
    end

    private

    # build Struct of rate limit information from Faraday::Utils::Headers
    #
    # @param [Faraday::Utils::Headers] header response header
    # @return [Struct<integer>] which has :limit :remain :reset
    def build_ratelimit(header)
      Struct.new(:limit, :remain, :reset)
            .new(header['x-ratelimit-limit'].to_i,
                 header['x-ratelimit-remaining'].to_i,
                 header['x-ratelimit-reset'].to_i)
    end
  end
end
