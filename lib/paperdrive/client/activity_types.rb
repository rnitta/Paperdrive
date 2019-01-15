# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to ActivityTypes to embed into Paperdrive::Client<br>
    # arguments are compatible with the Pipedribe API.
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/ActivityTypes
    module ActivityTypes
      include Paperdrive::Parameters

      # [GET] fetch activity types list
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/ActivityTypes/get_activityTypes
      # @return [Paperdrive::Response]
      def all_activity_types(**args)
        params = parameters(args) do
          optional_params
        end
        request(:get, 'activityTypes', params)
      end

      # [POST] create an activity type
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/ActivityTypes/post_activityTypes
      # @return [Paperdrive::Response]
      def create_activity_type(**args)
        params = parameters(args) do
          required_params :name, :icon_key
          optional_params :name, :icon_key, :color
        end
        request(:post, 'activityTypes', params)
      end

      # [PUT] update an activity type
      #
      # @param [integer] id: ID of the activity type to update
      # @see https://developers.pipedrive.com/docs/api/v1/#!/ActivityTypes/put_activityTypes_id
      # @return [Paperdrive::Response]
      def edit_activity_type(id:, **args)
        params = parameters(args) do
          optional_params :name, :icon_key, :color, :order_nr
        end
        request(:put, "activityTypes/#{id}", params)
      end

      # [DELETE] delete multiple activity types
      #
      # @example Delete activity types whose IDs are 1,2,3,4,5,6,7,8,9,10
      #   client.delete_activity_types(ids: [*(1..10)])
      # @see https://developers.pipedrive.com/docs/api/v1/#!/ActivityTypes/delete_activityTypes
      # @return [Paperdrive::Response]
      def delete_activitiy_types(**args)
        params = parameters(args) do
          required_params :ids
          optional_params :ids
        end
        request(:delete, 'activityTypes', params)
      end

      # [DELETE] delete an activity type
      #
      # @example Delete the activity type whose id = 1
      #   client.delete_activity_types(id: 1)
      # @see https://developers.pipedrive.com/docs/api/v1/#!/ActivityTypes/delete_activityTypes_id
      # @return [Paperdrive::Response]
      def delete_activity_type(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:delete, "activityTypes/#{id}", params)
      end
    end
  end
end
