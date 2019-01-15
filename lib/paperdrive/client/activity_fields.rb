# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to ActivityFields to embed into Paperdrive::Client
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/ActivityFields
    module ActivityFields
      include Paperdrive::Parameters

      # [GET] fetch all fields for activity.
      #
      # @example
      #   client.activity_fields.body
      #   #=> {
      #         "success": true,
      #         "data": [
      #           {
      #             "id": 1,
      #             "key": "id",
      #             "name": "ID",
      #              ....
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/ActivityFields/get_activityFields
      # @return [Paperdrive::Response]
      def all_activities(**args)
        params = parameters(args) do
          optional_params
        end
        request(:get, 'activityFields', params)
      end
    end
  end
end
