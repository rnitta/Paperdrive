# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to SearchResults to embed into Paperdrive::Client<br>
    # arguments are compatible with the Pipedribe API.
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/SearchResults
    module SearchResults
      include Paperdrive::Parameters

      # [GET] Perform a search
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/SearchResults/get_searchResults
      # @return [Paperdrive::Response]
      def search(**args)
        params = parameters(args) do
          required_params :term
          optional_params :term, :item_type, :start, :limit, :exact_match
        end
        request(:get, 'searchResults', params)
      end

      # [GET] Perform a search using a specific field value
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/SearchResults/get_searchResults_field
      # @return [Paperdrive::Response]
      def specific_search(**args)
        params = parameters(args) do
          required_params :term, :field_type, :field_key
          optional_params :term, :exact_match, :field_type, :field_key, :return_field_key, :return_item_ids, :start, :limit
        end
        request(:get, 'searchResults/field', params)
      end
    end
  end
end
