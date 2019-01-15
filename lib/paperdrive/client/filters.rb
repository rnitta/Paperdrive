# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to Filters to embed into Paperdrive::Client<br>
    # arguments are compatible with the Pipedribe API.
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/Filters
    module Filters
      include Paperdrive::Parameters

      # [GET] Get all filters
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Filters/get_filters
      # @return [Paperdrive::Response]
      def all_filters(**args)
        params = parameters(args) do
          optional_params :type
        end
        request(:get, 'filters', params)
      end

      # [GET] Get one filter
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Filters/get_filters_id
      # @return [Paperdrive::Response]
      def filter(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:get, "filters/#{id}", params)
      end

      # [POST] Add a new filter
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Filters/post_filters
      # @return [Paperdrive::Response]
      def create_filter(**args)
        params = parameters(args) do
          required_params :name, :conditions, :type
          optional_params :name, :conditions, :type
        end
        request(:post, 'filters', params)
      end

      # [PUT] Update filter
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Filters/put_filters_id
      # @return [Paperdrive::Response]
      def update_filter(id:, **args)
        params = parameters(args) do
          required_params :conditions
          optional_params :name, :conditions
        end
        request(:put, "filters/#{id}", params)
      end

      # [DELETE] Delete multiple filters in bulk
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Filters/delete_filters
      # @return [Paperdrive::Response]
      def delete_filters(**args)
        params = parameters(args) do
          required_params :ids
          optional_params :ids
        end
        request(:delete, 'filters', params)
      end

      # [DELETE] Delete a filter
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Filters/delete_filters_id
      # @return [Paperdrive::Response]
      def delete_filter(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:delete, "filters/#{id}", params)
      end
    end
  end
end
