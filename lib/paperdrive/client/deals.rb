# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to Deals to embed into Paperdrive::Client<br>
    # arguments are compatible with the Pipedribe API.
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals
    module Deals
      include Paperdrive::Parameters

      # [GET] Get all deals
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals/get_deals
      # @return [Paperdrive::Response]
      def all_deals(**args)
        params = parameters(args) do
          optional_params :user_id, :filter_id, :stage_id, :status, :start, :limit, :sort, :owned_by_you
        end
        request(:get, 'deals', params)
      end

      # [GET] Find deals by name
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals/get_deals_find
      # @return [Paperdrive::Response]
      def find_deals_by_name(**args)
        params = parameters(args) do
          required_params :term
          optional_params :term, :person_id, :org_id
        end
        request(:get, 'deals/find', params)
      end

      # [GET] Get deals timeline
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals/get_deals_timeline
      # @return [Paperdrive::Response]
      def deals_timeline(**args)
        params = parameters(args) do
          required_params :start_date, :interval, :amount, :field_key
          optional_params :start_date, :interval, :amount, :field_key, :user_id, :pipeline_id, :filter_id, :exclude_deals, :totals_convert_currency
        end
        request(:get, 'deals/timeline', params)
      end

      # [GET] Get details of a deal
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals/get_deals_id
      # @return [Paperdrive::Response]
      def deal_detail(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:get, "deals/#{id}", params)
      end

      # [GET] List activities associated with a deal
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals/get_deals_id_activities
      # @return [Paperdrive::Response]
      def deal_activities(id:, **args)
        params = parameters(args) do
          optional_params :start, :limit, :done, :exclude
        end
        request(:get, "deals/#{id}/activities", params)
      end

      # [GET] List files attached to a deal
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals/get_deals_id_files
      # @return [Paperdrive::Response]
      def deal_files(id:, **args)
        params = parameters(args) do
          optional_params :start, :limit, :include_deleted_files, :sort
        end
        request(:get, "deals/#{id}/files", params)
      end

      # [GET] List updates about a deal
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals/get_deals_id_flow
      # @return [Paperdrive::Response]
      def deal_updates(id:, **args)
        params = parameters(args) do
          optional_params :start, :limit
        end
        request(:get, "deals/#{id}/flow", params)
      end

      # [GET] List followers of a deal
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals/get_deals_id_followers
      # @return [Paperdrive::Response]
      def deal_followers(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:get, "deals/#{id}/followers", params)
      end

      # [GET] List mail messages associated with a deal
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals/get_deals_id_mailMessages
      # @return [Paperdrive::Response]
      def deal_mail_messages(id:, **args)
        params = parameters(args) do
          optional_params :start, :limit
        end
        request(:get, "deals/#{id}/mailMessages", params)
      end

      # [GET] List participants of a deal
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals/get_deals_id_participants
      # @return [Paperdrive::Response]
      def deal_participants(id:, **args)
        params = parameters(args) do
          optional_params :start, :limit
        end
        request(:get, "deals/#{id}/participants", params)
      end

      # [GET] List permitted users
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals/get_deals_id_permittedUsers
      # @return [Paperdrive::Response]
      def deal_permitted_users(id:, **args)
        params = parameters(args) do
          optional_params :access_level
        end
        request(:get, "deals/#{id}/permittedUsers", params)
      end

      # [GET] List all persons associated with a deal
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals/get_deals_id_persons
      # @return [Paperdrive::Response]
      def deal_persons(id:, **args)
        params = parameters(args) do
          optional_params :start, :limit
        end
        request(:get, "deals/#{id}/persons", params)
      end

      # [GET] List products attached to a deal
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals/get_deals_id_products
      # @return [Paperdrive::Response]
      def deal_products(id:, **args)
        params = parameters(args) do
          optional_params :start, :limit, :include_product_data
        end
        request(:get, "deals/#{id}/products", params)
      end

      # [POST] Add a deal
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals/post_deals
      # @return [Paperdrive::Response]
      def create_deal(**args)
        params = parameters(args) do
          required_params :title
          optional_params :title, :value, :currency, :user_id, :person_id, :org_id, :stage_id, :status, :probability, :lost_reason, :add_time, :visible_to
        end
        request(:post, 'deals', params)
      end

      # [POST] Duplicate deal
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals/post_deals_id_duplicate
      # @return [Paperdrive::Response]
      def duplicate_deal(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:post, "deals/#{id}/duplicate", params)
      end

      # [POST] Add a follower to a deal
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals/post_deals_id_followers
      # @return [Paperdrive::Response]
      def add_follower_to_deal(id:, **args)
        params = parameters(args) do
          required_params :user_id
          optional_params :user_id
        end
        request(:post, "deals/#{id}/followers", params)
      end

      # [POST] Add a participant to a deal
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals/post_deals_id_participants
      # @return [Paperdrive::Response]
      def add_participant_to_deal(id:, **args)
        params = parameters(args) do
          required_params :person_id
          optional_params :person_id
        end
        request(:post, "deals/#{id}/participants", params)
      end

      # [POST] Add a product to the deal, eventually creating a new item called a deal-product.
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals/post_deals_id_products
      # @return [Paperdrive::Response]
      def add_product_to_deal(id:, **args)
        params = parameters(args) do
          required_params :product_id, :item_price, :quantity
          optional_params :product_id, :item_price, :quantity, :discount_percentage, :duration, :product_variation_id, :comments, :enabled_flag
        end
        request(:post, "deals/#{id}/products", params)
      end

      # [PUT] Update a deal
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals/put_deals_id
      # @return [Paperdrive::Response]
      def update_deal(id:, **args)
        params = parameters(args) do
          optional_params :title, :value, :currency, :user_id, :person_id, :org_id, :stage_id, :status, :probability, :lost_reason, :visible_to
        end
        request(:put, "deals/#{id}", params)
      end

      # [PUT] Merge two deals
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals/put_deals_id_merge
      # @return [Paperdrive::Response]
      def merge_deals(id:, **args)
        params = parameters(args) do
          required_params :merge_with_id
          optional_params :merge_with_id
        end
        request(:put, "deals/#{id}/merge", params)
      end

      # [PUT] Update product attachment details of the deal-product (a product already attached to a deal)
      #
      # @param [integer] id:
      # @param [integer] deal_product_id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals/put_deals_id_products_deal_product_id
      # @return [Paperdrive::Response]
      def update_deal_product(id:, deal_product_id:, **args)
        params = parameters(args) do
          required_params :item_price, :quantity
          optional_params :item_price, :quantity, :discount_percentage, :duration, :product_variation_id, :comments, :enabled_flag
        end
        request(:put, "deals/#{id}/products/#{deal_product_id}", params)
      end

      # [DELETE] Delete multiple deals in bulk
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals/delete_deals
      # @return [Paperdrive::Response]
      def delete_deals(**args)
        params = parameters(args) do
          required_params :ids
          optional_params :ids
        end
        request(:delete, 'deals', params)
      end

      # [DELETE] Delete a deal
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals/delete_deals_id
      # @return [Paperdrive::Response]
      def delete_deal(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:delete, "deals/#{id}", params)
      end

      # [DELETE] Delete a follower from a deal
      #
      # @param [integer] id:
      # @param [integer] follower_id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals/delete_deals_id_followers_follower_id
      # @return [Paperdrive::Response]
      def delete_deal_follower(id:, follower_id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:delete, "deals/#{id}/followers/#{follower_id}", params)
      end

      # [DELETE] Delete a participant from a deal
      #
      # @param [integer] id:
      # @param [integer] deal_participant_id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals/delete_deals_id_participants_deal_participant_id
      # @return [Paperdrive::Response]
      def delete_deal_participants(id:, deal_participant_id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:delete, "deals/#{id}/participants/#{deal_participant_id}", params)
      end

      # [DELETE] Delete an attached product from a deal
      #
      # @param [integer] id:
      # @param [integer] product_attachment_id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Deals/delete_deals_id_products_product_attachment_id
      # @return [Paperdrive::Response]
      def delete_deal_product(id:, product_attachment_id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:delete, "deals/#{id}/products/#{product_attachment_id}", params)
      end
    end
  end
end
