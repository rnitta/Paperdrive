# frozen_string_literal: true

module Paperdrive
  class RateLimit
    class << self
      def from(response)
        {}.tap do |rl|
          if response && !response.headers.nil?
            rl['limit'] = response.headers['x-ratelimit-limit'].to_i
            rl['remaining'] = response.headers['x-ratelimit-remaining'].to_i
            rl['resets_in'] = response.headers['x-ratelimit-reset'].to_i
          end
        end
      end
    end
  end
end
