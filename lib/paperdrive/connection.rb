# frozen_string_literal: true

require 'http'
require 'paperdrive/error'
require 'paperdrive/rate_limit'

using Module.new {
  refine HTTP::Response do
    def to_h
      body = parse
      header = headers.to_h
      rate_limit = Paperdrive::RateLimit.from(self)
      { 'rate_limit' => rate_limit, 'header' => header, 'body' => body }
    end
  end
}

module Paperdrive
  module Connection
    BASE_URL = 'https://api.pipedrive.com/v1/'.freeze

    protected

    def get(path, data)
      response = HTTP.get(Addressable::URI.parse(BASE_URL + path.to_s).normalize.to_s, params: { api_token: Paperdrive.instance_variable_get(:@token) }.merge(data))
      Paperdrive::Error.raise_from(response)
      response.to_h
    end

    def post(path, data)
      response = HTTP.post(Addressable::URI.parse(BASE_URL + path.to_s).normalize.to_s, params: { api_token: Paperdrive.instance_variable_get(:@token) }, json: data)
      Paperdrive::Error.raise_from(response)
      response.to_h
    end

    def put(path, data)
      response = HTTP.put(Addressable::URI.parse(BASE_URL + path.to_s).normalize.to_s, params: { api_token: Paperdrive.instance_variable_get(:@token) }, json: data)
      Paperdrive::Error.raise_from(response)
      response.to_h
    end

    def delete(path, data)
      response = HTTP.delete(Addressable::URI.parse(BASE_URL + path.to_s).normalize.to_s, params: { api_token: Paperdrive.instance_variable_get(:@token) }, json: data)
      Paperdrive::Error.raise_from(response)
      response.to_h
    end
  end
end
