# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to MailMessages to embed into Paperdrive::Client<br>
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/MailMessages
    module MailMessages
      include Paperdrive::Parameters

      # [GET] Get one mail message
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/MailMessages/get_mailbox_mailMessages_id
      # @return [Paperdrive::Response]
      def mail_message(id:, **args)
        params = parameters(args) do
          optional_params :include_body
        end
        request(:get, "mailbox/mailMessages/#{id}", params)
      end
    end
  end
end
