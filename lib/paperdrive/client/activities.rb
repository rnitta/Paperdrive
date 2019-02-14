# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to Activities to embed into Paperdrive::Client<br>
    # arguments are compatible with the Pipedribe API.
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/Activities
    module Activities
      include Paperdrive::Parameters

      # [GET] fetch Activities list
      #
      # @example
      #   client.all_activities(type: 'task', start_date: '2020-05-01', done: 0)
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Activities/get_activities
      # @return [Paperdrive::Response]
      def all_activities(**args)
        params = parameters(args) do
          optional_params :user_id, :filter_id, :type, :start, :limit, :start_date, :end_date, :done
        end
        request(:get, 'activities', params)
      end

      # [GET] fetch a single activity
      #
      # @param [integer] id: ID of the activity to fetch
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Activities/get_activities_id
      # @return [Paperdrive::Response]
      def activity_detail(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:get, "activities/#{id}", params)
      end

      # [POST] create a single activity
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Activities/post_activities
      # @return [Paperdrive::Response]
      def create_activity(**args)
        params = parameters(args) do
          required_params :subject, :type
          optional_params :subject, :type, :done, :due_date, :due_time, :duration, :user_id, :deal_id, :person_id, :participants, :org_id, :note
        end
        request(:post, 'activities', params)
      end

      # [PUT] update a single activity
      #
      # @param [integer] id: ID of the actibity to update
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Activities/put_activities_id
      # @return [Paperdrive::Response]
      def update_activity(id:, **args)
        params = parameters(args) do
          optional_params :subject, :type, :done, :due_date, :due_time, :duration, :user_id, :deal_id, :person_id, :participants, :org_id, :note
        end
        request(:put, "activities/#{id}", params)
      end

      alias_method :update_activity, :update_activity

      # [DELETE] delete multiple activities
      #
      # @example Delete activities whose IDs are 1,2,3,4,5,6,7,8,9,10
      #   client.delete_activities(ids: [*(1..10)])
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Activities/delete_activities
      # @return [Paperdrive::Response]
      def delete_activities(**args)
        params = parameters(args) do
          required_params :ids
          optional_params :ids
        end
        request(:delete, 'activities', params)
      end

      # [DELETE] delete a single activity
      #
      # @example Delete the actibity whose id = 1
      #   client.delete_activities(id: 1)
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Activities/delete_activities_id
      # @return [Paperdrive::Response]
      def delete_activity(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:delete, "activities/#{id}", params)
      end
    end
  end
end
