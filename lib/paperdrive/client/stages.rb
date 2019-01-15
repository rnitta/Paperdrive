# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to Stages to embed into Paperdrive::Client<br>
    # arguments are compatible with the Pipedribe API.
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/Stages
    module Stages
      include Paperdrive::Parameters

      # [GET] Get all stages
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Stages/get_stages
      # @return [Paperdrive::Response]
      def all_stages(**args)
        params = parameters(args) do
          optional_params :pipeline_id
        end
        request(:get, 'stages', params)
      end

      # [GET] Get one stage
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Stages/get_stages_id
      # @return [Paperdrive::Response]
      def stage(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:get, "stages/#{id}", params)
      end

      # [GET] Get deals in a stage
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Stages/get_stages_id_deals
      # @return [Paperdrive::Response]
      def stage_deals(id:, **args)
        params = parameters(args) do
          optional_params :filter_id, :user_id, :everyone, :start, :limit
        end
        request(:get, "stages/#{id}/deals", params)
      end

      # [POST] Add a new stage
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Stages/post_stages
      # @return [Paperdrive::Response]
      def create_stage(**args)
        params = parameters(args) do
          required_params :name, :pipeline_id
          optional_params :name, :pipeline_id, :deal_probability, :rotten_flag, :rotten_days
        end
        request(:post, 'stages', params)
      end

      # [PUT] Update stage details
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Stages/put_stages_id
      # @return [Paperdrive::Response]
      def update_stage(id:, **args)
        params = parameters(args) do
          optional_params :name, :pipeline_id, :order_nr, :deal_probability, :rotten_flag, :rotten_days
        end
        request(:put, "stages/#{id}", params)
      end

      # [DELETE] Delete multiple stages in bulk
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Stages/delete_stages
      # @return [Paperdrive::Response]
      def delete_stages(**args)
        params = parameters(args) do
          required_params :ids
          optional_params :ids
        end
        request(:delete, 'stages', params)
      end

      # [DELETE] Delete a stage
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Stages/delete_stages_id
      # @return [Paperdrive::Response]
      def delete_stage(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:delete, "stages/#{id}", params)
      end
    end
  end
end
