# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to Notes to embed into Paperdrive::Client<br>
    # arguments are compatible with the Pipedribe API.
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/Notes
    module Notes
      include Paperdrive::Parameters

      # [GET] fetch Notes list
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Notes/get_notes
      # @return [Paperdrive::Response]
      def all_notes(**args)
        params = parameters(args) do
          optional_params :user_id, :deal_id, :person_id, :org_id, :start, :limit, :sort, :start_date, :end_date, :pinned_to_deal_flag, :pinned_to_organization_flag, :pinned_to_person_flag
        end
        request(:get, 'notes', params)
      end

      # [GET] fetch a single note whose ID specified
      #
      # @param [integer] id: ID of the note to fetch
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Notes/get_notes_id
      # @return [Paperdrive::Response]
      def note_detail(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:get, "notes/#{id}", params)
      end

      # [POST] create a single Note
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Notes/post_notes
      # @return [Paperdrive::Response]
      def create_note(**args)
        params = parameters(args) do
          required_params :content
          optional_params :content, :deal_id, :person_id, :org_id, :add_time, :pinned_to_deal_flag, :pinned_to_organization_flag, :pinned_to_person_flag
        end
        request(:post, 'notes', params)
      end

      # [PUT] update a single note
      #
      # @param [integer] id: ID of the note to update
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Notes/put_notes_id
      # @return [Paperdrive::Response]
      def edit_note(id:, **args)
        params = parameters(args) do
          required_params :content
          optional_params :content, :deal_id, :person_id, :org_id, :add_time, :pinned_to_deal_flag, :pinned_to_organization_flag, :pinned_to_person_flag
        end
        request(:put, "notes/#{id}", params)
      end

      # [DELETE] delete a single note
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Notes/delete_notes_id
      # @return [Paperdrive::Response]
      def delete_note(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:delete, "notes/#{id}", params)
      end
    end
  end
end
