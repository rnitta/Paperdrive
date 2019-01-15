# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to Webhooks to embed into Paperdrive::Client<br>
    # arguments are compatible with the Pipedribe API.
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/Webhooks
    module Webhooks
      include Paperdrive::Parameters

      # [GET] Get all webhooks
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Webhooks/get_webhooks
      # @return [Paperdrive::Response]
      def all_webhooks(**args)
        params = parameters(args) do
          optional_params
        end
        request(:get, 'webhooks', params)
      end

      # [POST] Create a new webhook
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Webhooks/post_webhooks
      # @return [Paperdrive::Response]
      def create_webhook(**args)
        params = parameters(args) do
          required_params :subscription_url, :event_action, :event_object
          optional_params :subscription_url, :event_action, :event_object, :user_id, :http_auth_user, :http_auth_password
        end
        request(:post, 'webhooks', params)
      end

      # [DELETE] Delete existing webhook
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Webhooks/delete_webhooks_id
      # @return [Paperdrive::Response]
      def delete_webhook(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:delete, "webhooks/#{id}", params)
      end
    end
  end
end
