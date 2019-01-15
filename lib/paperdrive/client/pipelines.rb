# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to Pipelines to embed into Paperdrive::Client<br>
    # arguments are compatible with the Pipedribe API.
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/Pipelines
    module Pipelines
      include Paperdrive::Parameters

      # [GET] Get all pipelines
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Pipelines/get_pipelines
      # @return [Paperdrive::Response]
      def all_pipelines(**args)
        params = parameters(args) do
          optional_params
        end
        request(:get, 'pipelines', params)
      end

      # [GET] Get one pipeline
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Pipelines/get_pipelines_id
      # @return [Paperdrive::Response]
      def pipeline(id:, **args)
        params = parameters(args) do
          optional_params :totals_convert_currency
        end
        request(:get, "pipelines/#{id}", params)
      end

      # [GET] Get deals conversion rates in pipeline
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Pipelines/get_pipelines_id_conversion_statistics
      # @return [Paperdrive::Response]
      def pipeline_deals_cvr(id:, **args)
        params = parameters(args) do
          required_params :start_date, :end_date
          optional_params :start_date, :end_date, :user_id
        end
        request(:get, "pipelines/#{id}/conversion_statistics", params)
      end

      # [GET] Get deals in a pipeline
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Pipelines/get_pipelines_id_deals
      # @return [Paperdrive::Response]
      def pipeline_deals(id:, **args)
        params = parameters(args) do
          optional_params :filter_id, :user_id, :everyone, :stage_id, :start, :limit, :get_summary, :totals_convert_currency
        end
        request(:get, "pipelines/#{id}/deals", params)
      end

      # [GET] Get deals movements in pipeline
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Pipelines/get_pipelines_id_movement_statistics
      # @return [Paperdrive::Response]
      def pipeline_deals_movements(id:, **args)
        params = parameters(args) do
          required_params :start_date, :end_date
          optional_params :start_date, :end_date, :user_id
        end
        request(:get, "pipelines/#{id}/movement_statistics", params)
      end

      # [POST] Add a new pipeline
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Pipelines/post_pipelines
      # @return [Paperdrive::Response]
      def create_pipeline(**args)
        params = parameters(args) do
          optional_params :name, :deal_probability, :order_nr, :active
        end
        request(:post, 'pipelines', params)
      end

      # [PUT] Edit a pipeline
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Pipelines/put_pipelines_id
      # @return [Paperdrive::Response]
      def update_pipeline(id:, **args)
        params = parameters(args) do
          optional_params :name, :deal_probability, :order_nr, :active
        end
        request(:put, "pipelines/#{id}", params)
      end

      # [DELETE] Delete a pipeline
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Pipelines/delete_pipelines_id
      # @return [Paperdrive::Response]
      def delete_pipeline(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:delete, "pipelines/#{id}", params)
      end
    end
  end
end
