# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to Recents to embed into Paperdrive::Client<br>
    # arguments are compatible with the Pipedribe API.
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/Recents
    module Recents
      include Paperdrive::Parameters

      # [GET] Get recents
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Recents/get_recents
      # @return [Paperdrive::Response]
      def recents(**args)
        params = parameters(args) do
          required_params :since_timestamp
          optional_params :since_timestamp, :items, :start, :limit
        end
        request(:get, 'recents', params)
      end
    end
  end
end
