# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to Currencies to embed into Paperdrive::Client<br>
    # arguments are compatible with the Pipedribe API.
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/Currencies
    module Currencies
      include Paperdrive::Parameters

      # [GET] fetch all supported currencies
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Currencies/get_currencies
      # @return [Paperdrive::Response]
      def all_currencies(**args)
        params = parameters(args) do
          optional_params :term
        end
        request(:get, 'currencies', params)
      end
    end
  end
end
