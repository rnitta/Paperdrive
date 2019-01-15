# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to UserConnections to embed into Paperdrive::Client<br>
    # arguments are compatible with the Pipedribe API.
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/UserConnections
    module UserConnections
      include Paperdrive::Parameters

      # [GET] Get all user connections
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/UserConnections/get_userConnections
      # @return [Paperdrive::Response]
      def all_user_connections(**args)
        params = parameters(args) do
          optional_params
        end
        request(:get, 'userConnections', params)
      end
    end
  end
end
