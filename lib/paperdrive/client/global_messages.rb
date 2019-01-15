# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to GlobalMessages to embed into Paperdrive::Client<br>
    # arguments are compatible with the Pipedribe API.
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/GlobalMessages
    module GlobalMessages
      include Paperdrive::Parameters

      # [GET] Get global messages
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/GlobalMessages/get_globalMessages
      # @return [Paperdrive::Response]
      def all_global_messages(**args)
        params = parameters(args) do
          optional_params :limit
        end
        request(:get, 'globalMessages', params)
      end

      # [DELETE] Delete a global message
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/GlobalMessages/delete_globalMessages_id
      # @return [Paperdrive::Response]
      def delete_global_message(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:delete, "globalMessages/#{id}", params)
      end
    end
  end
end
