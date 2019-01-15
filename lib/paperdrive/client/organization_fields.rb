# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to OrganizationFields to embed into Paperdrive::Client<br>
    # arguments are compatible with the Pipedribe API.
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/OrganizationFields
    module OrganizationFields
      include Paperdrive::Parameters

      # [GET] Get all organization fields
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/OrganizationFields/get_organizationFields
      # @return [Paperdrive::Response]
      def all_organization_fields(**args)
        params = parameters(args) do
          optional_params
        end
        request(:get, 'organizationFields', params)
      end

      # [GET] Get one organization field
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/OrganizationFields/get_organizationFields_id
      # @return [Paperdrive::Response]
      def organization_field(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:get, "organizationFields/#{id}", params)
      end

      # [POST] Add a new organization field
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/OrganizationFields/post_organizationFields
      # @return [Paperdrive::Response]
      def create_organization_field(**args)
        params = parameters(args) do
          required_params :name, :field_type
          optional_params :name, :field_type, :options
        end
        request(:post, 'organizationFields', params)
      end

      # [PUT] Update an organization field
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/OrganizationFields/put_organizationFields_id
      # @return [Paperdrive::Response]
      def update_organization_field(id:, **args)
        params = parameters(args) do
          required_params :name
          optional_params :name, :options
        end
        request(:put, "organizationFields/#{id}", params)
      end

      # [DELETE] Delete multiple organization fields in bulk
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/OrganizationFields/delete_organizationFields
      # @return [Paperdrive::Response]
      def delete_organization_fields(**args)
        params = parameters(args) do
          required_params :ids
          optional_params :ids
        end
        request(:delete, 'organizationFields', params)
      end

      # [DELETE] Delete an organization field
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/OrganizationFields/delete_organizationFields_id
      # @return [Paperdrive::Response]
      def delete_organization_field(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:delete, "organizationFields/#{id}", params)
      end
    end
  end
end
