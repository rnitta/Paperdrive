# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to OrganizationRelationships to embed into Paperdrive::Client<br>
    # arguments are compatible with the Pipedribe API.
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/OrganizationRelationships
    module OrganizationRelationships
      include Paperdrive::Parameters

      # [GET] Get all relationships for organization
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/OrganizationRelationships/get_organizationRelationships
      # @return [Paperdrive::Response]
      def all_organization_relationships(**args)
        params = parameters(args) do
          required_params :org_id
          optional_params :org_id
        end
        request(:get, 'organizationRelationships', params)
      end

      # [GET] Get one organization relationship
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/OrganizationRelationships/get_organizationRelationships_id
      # @return [Paperdrive::Response]
      def organization_relationship(id:, **args)
        params = parameters(args) do
          optional_params :org_id
        end
        request(:get, "organizationRelationships/#{id}", params)
      end

      # [POST] Create an organization relationship
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/OrganizationRelationships/post_organizationRelationships
      # @return [Paperdrive::Response]
      def create_organization_relationship(**args)
        params = parameters(args) do
          required_params :type, :rel_owner_org_id, :rel_linked_org_id
          optional_params :org_id, :type, :rel_owner_org_id, :rel_linked_org_id
        end
        request(:post, 'organizationRelationships', params)
      end

      # [PUT] Update an organization relationship
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/OrganizationRelationships/put_organizationRelationships_id
      # @return [Paperdrive::Response]
      def update_organization_relationship(id:, **args)
        params = parameters(args) do
          optional_params :org_id, :type, :rel_owner_org_id, :rel_linked_org_id
        end
        request(:put, "organizationRelationships/#{id}", params)
      end

      # [DELETE] Delete an organization relationship
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/OrganizationRelationships/delete_organizationRelationships_id
      # @return [Paperdrive::Response]
      def delete_organization_relationship(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:delete, "organizationRelationships/#{id}", params)
      end
    end
  end
end
