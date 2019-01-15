# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to DealFields to embed into Paperdrive::Client<br>
    # arguments are compatible with the Pipedribe API.
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/DealFields
    module DealFields
      include Paperdrive::Parameters

      # [GET] Get all deal fields
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/DealFields/get_dealFields
      # @return [Paperdrive::Response]
      def all_deal_fields(**args)
        params = parameters(args) do
          optional_params :start, :limit
        end
        request(:get, 'dealFields', params)
      end

      # [GET] Get one deal field
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/DealFields/get_dealFields_id
      # @return [Paperdrive::Response]
      def deal_field(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:get, "dealFields/#{id}", params)
      end

      # [POST] Add a new deal field
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/DealFields/post_dealFields
      # @return [Paperdrive::Response]
      def create_deal_field(**args)
        params = parameters(args) do
          required_params :name, :field_type
          optional_params :name, :field_type, :options
        end
        request(:post, 'dealFields', params)
      end

      # [PUT] Update a deal field
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/DealFields/put_dealFields_id
      # @return [Paperdrive::Response]
      def update_deal_field(id:, **args)
        params = parameters(args) do
          required_params :name
          optional_params :name, :options
        end
        request(:put, "dealFields/#{id}", params)
      end

      # [DELETE] Delete multiple deal fields in bulk
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/DealFields/delete_dealFields
      # @return [Paperdrive::Response]
      def delete_deal_fields(**args)
        params = parameters(args) do
          required_params :ids
          optional_params :ids
        end
        request(:delete, 'dealFields', params)
      end

      # [DELETE] Delete a deal field
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/DealFields/delete_dealFields_id
      # @return [Paperdrive::Response]
      def delete_deal_field(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:delete, "dealFields/#{id}", params)
      end
    end
  end
end
