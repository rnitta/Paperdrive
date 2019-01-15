# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to MailThreads to embed into Paperdrive::Client<br>
    # arguments are compatible with the Pipedribe API.
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/MailThreads
    module MailThreads
      include Paperdrive::Parameters

      # [GET] Get mail threads
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/MailThreads/get_mailbox_mailThreads
      # @return [Paperdrive::Response]
      def all_mail_threads(**args)
        params = parameters(args) do
          required_params :folder
          optional_params :folder, :start, :limit
        end
        request(:get, 'mailbox/mailThreads', params)
      end

      # [GET] Get one mail thread
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/MailThreads/get_mailbox_mailThreads_id
      # @return [Paperdrive::Response]
      def mail_thread(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:get, "mailbox/mailThreads/#{id}", params)
      end

      # [GET] Get all mail messages of mail thread
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/MailThreads/get_mailbox_mailThreads_id_mailMessages
      # @return [Paperdrive::Response]
      def mail_thread_mail_messages(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:get, "mailbox/mailThreads/#{id}/mailMessages", params)
      end

      # [PUT] Update mail thread details
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/MailThreads/put_mailbox_mailThreads_id
      # @return [Paperdrive::Response]
      def update_mail_thread(id:, **args)
        params = parameters(args) do
          optional_params :deal_id, :shared_flag, :read_flag, :archived_flag
        end
        request(:put, "mailbox/mailThreads/#{id}", params)
      end

      # [DELETE] Delete mail thread
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/MailThreads/delete_mailbox_mailThreads_id
      # @return [Paperdrive::Response]
      def delete_mail_thread(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:delete, "mailbox/mailThreads/#{id}", params)
      end
    end
  end
end
