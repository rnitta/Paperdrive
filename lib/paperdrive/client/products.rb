# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to Products to embed into Paperdrive::Client<br>
    # arguments are compatible with the Pipedribe API.
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/Products
    module Products
      include Paperdrive::Parameters

      # [GET] Get all products
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Products/get_products
      # @return [Paperdrive::Response]
      def all_products(**args)
        params = parameters(args) do
          optional_params :user_id, :filter_id, :first_char, :start, :limit
        end
        request(:get, 'products', params)
      end

      # [GET] Find products by name
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Products/get_products_find
      # @return [Paperdrive::Response]
      def find_products_by_name(**args)
        params = parameters(args) do
          required_params :term
          optional_params :term, :currency, :start, :limit
        end
        request(:get, 'products/find', params)
      end

      # [GET] Get one product
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Products/get_products_id
      # @return [Paperdrive::Response]
      def product(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:get, "products/#{id}", params)
      end

      # [GET] Get deals where a product is attached to
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Products/get_products_id_deals
      # @return [Paperdrive::Response]
      def product_deals(id:, **args)
        params = parameters(args) do
          optional_params :start, :limit, :status
        end
        request(:get, "products/#{id}/deals", params)
      end

      # [GET] List files attached to a product
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Products/get_products_id_files
      # @return [Paperdrive::Response]
      def product_files(id:, **args)
        params = parameters(args) do
          optional_params :start, :limit, :include_deleted_files, :sort
        end
        request(:get, "products/#{id}/files", params)
      end

      # [GET] List followers of a product
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Products/get_products_id_followers
      # @return [Paperdrive::Response]
      def product_followers(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:get, "products/#{id}/followers", params)
      end

      # [GET] List permitted users
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Products/get_products_id_permittedUsers
      # @return [Paperdrive::Response]
      def product_permitted_users(id:, **args)
        params = parameters(args) do
          optional_params :access_level
        end
        request(:get, "products/#{id}/permittedUsers", params)
      end

      # [POST] Add a product
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Products/post_products
      # @return [Paperdrive::Response]
      def create_product(**args)
        params = parameters(args) do
          required_params :name
          optional_params :name, :code, :unit, :tax, :active_flag, :visible_to, :owner_id, :prices
        end
        request(:post, 'products', params)
      end

      # [POST] Add a follower to a product
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Products/post_products_id_followers
      # @return [Paperdrive::Response]
      def create_product_follower(id:, **args)
        params = parameters(args) do
          required_params :user_id
          optional_params :user_id
        end
        request(:post, "products/#{id}/followers", params)
      end

      # [PUT] Update a product
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Products/put_products_id
      # @return [Paperdrive::Response]
      def update_product(id:, **args)
        params = parameters(args) do
          optional_params :name, :code, :unit, :tax, :active_flag, :visible_to, :owner_id, :prices
        end
        request(:put, "products/#{id}", params)
      end

      # [DELETE] Delete a product
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Products/delete_products_id
      # @return [Paperdrive::Response]
      def delete_product(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:delete, "products/#{id}", params)
      end

      # [DELETE] Delete a follower from a product
      #
      # @param [integer] id:
      # @param [integer] follower_id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Products/delete_products_id_followers_follower_id
      # @return [Paperdrive::Response]
      def delete_product_follower(id:, follower_id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:delete, "products/#{id}/followers/#{follower_id}", params)
      end
    end
  end
end
