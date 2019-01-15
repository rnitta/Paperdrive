# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to PersonFields to embed into Paperdrive::Client<br>
    # arguments are compatible with the Pipedribe API.
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/PersonFields
    module PersonFields
      include Paperdrive::Parameters

      # [GET] Get all person fields
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/PersonFields/get_personFields
      # @return [Paperdrive::Response]
      def all_person_fields(**args)
        params = parameters(args) do
          optional_params
        end
        request(:get, 'personFields', params)
      end

      # [GET] Get one person field
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/PersonFields/get_personFields_id
      # @return [Paperdrive::Response]
      def person_field(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:get, "personFields/#{id}", params)
      end

      # [POST] Add a new person field
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/PersonFields/post_personFields
      # @return [Paperdrive::Response]
      def create_person_field(**args)
        params = parameters(args) do
          required_params :name, :field_type
          optional_params :name, :field_type, :options
        end
        request(:post, 'personFields', params)
      end

      # [PUT] Update a person field
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/PersonFields/put_personFields_id
      # @return [Paperdrive::Response]
      def update_person_field(id:, **args)
        params = parameters(args) do
          required_params :name
          optional_params :name, :options
        end
        request(:put, "personFields/#{id}", params)
      end

      # [DELETE] Delete multiple person fields in bulk
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/PersonFields/delete_personFields
      # @return [Paperdrive::Response]
      def delete_person_fields(**args)
        params = parameters(args) do
          required_params :ids
          optional_params :ids
        end
        request(:delete, 'personFields', params)
      end

      # [DELETE] Delete a person field
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/PersonFields/delete_personFields_id
      # @return [Paperdrive::Response]
      def delete_person_field(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:delete, "personFields/#{id}", params)
      end
    end
  end
end
