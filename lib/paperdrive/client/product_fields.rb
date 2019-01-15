# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to ProductFields to embed into Paperdrive::Client<br>
    # arguments are compatible with the Pipedribe API.
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/ProductFields
    module ProductFields
      include Paperdrive::Parameters

      # [GET] Get all product fields
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/ProductFields/get_productFields
      # @return [Paperdrive::Response]
      def all_product_fields(**args)
        params = parameters(args) do
          optional_params
        end
        request(:get, 'productFields', params)
      end

      # [GET] Get one product field
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/ProductFields/get_productFields_id
      # @return [Paperdrive::Response]
      def product_field(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:get, "productFields/#{id}", params)
      end

      # [POST] Add a new product field
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/ProductFields/post_productFields
      # @return [Paperdrive::Response]
      def create_product_field(**args)
        params = parameters(args) do
          required_params :name, :field_type
          optional_params :name, :field_type, :options
        end
        request(:post, 'productFields', params)
      end

      # [PUT] Update a product field
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/ProductFields/put_productFields_id
      # @return [Paperdrive::Response]
      def update_product_field(id:, **args)
        params = parameters(args) do
          required_params :name
          optional_params :name, :options
        end
        request(:put, "productFields/#{id}", params)
      end

      # [DELETE] Delete multiple product fields in bulk
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/ProductFields/delete_productFields
      # @return [Paperdrive::Response]
      def delete_product_fields(**args)
        params = parameters(args) do
          required_params :ids
          optional_params :ids
        end
        request(:delete, 'productFields', params)
      end

      # [DELETE] Delete a product field
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/ProductFields/delete_productFields_id
      # @return [Paperdrive::Response]
      def delete_product_field(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:delete, "productFields/#{id}", params)
      end
    end
  end
end
