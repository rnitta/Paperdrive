# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to UserSettings to embed into Paperdrive::Client<br>
    # arguments are compatible with the Pipedribe API.
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/UserSettings
    module UserSettings
      include Paperdrive::Parameters

      # [GET] List settings of authorized user
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/UserSettings/get_userSettings
      # @return [Paperdrive::Response]
      def current_user_settings(**args)
        params = parameters(args) do
          optional_params
        end
        request(:get, 'userSettings', params)
      end
    end
  end
end
