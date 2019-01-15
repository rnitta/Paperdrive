# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to PermissionSets to embed into Paperdrive::Client<br>
    # arguments are compatible with the Pipedribe API.
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/PermissionSets
    module PermissionSets
      include Paperdrive::Parameters

      # [GET] Get all permission sets
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/PermissionSets/get_permissionSets
      # @return [Paperdrive::Response]
      def all_permission_sets(**args)
        params = parameters(args) do
          optional_params
        end
        request(:get, 'permissionSets', params)
      end

      # [GET] Get one permission set
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/PermissionSets/get_permissionSets_id
      # @return [Paperdrive::Response]
      def permission_set(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:get, "permissionSets/#{id}", params)
      end

      # [GET] List permission set assignments
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/PermissionSets/get_permissionSets_id_assignments
      # @return [Paperdrive::Response]
      def all_permission_set_assignments(id:, **args)
        params = parameters(args) do
          optional_params :start, :limit
        end
        request(:get, "permissionSets/#{id}/assignments", params)
      end

      # [POST] Add permission set assignment
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/PermissionSets/post_permissionSets_id_assignments
      # @return [Paperdrive::Response]
      def create_permission_set_assignment(id:, **args)
        params = parameters(args) do
          required_params :user_id
          optional_params :user_id
        end
        request(:post, "permissionSets/#{id}/assignments", params)
      end

      # [PUT] Update permission set details
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/PermissionSets/put_permissionSets_id
      # @return [Paperdrive::Response]
      def update_permission_set(id:, **args)
        params = parameters(args) do
          required_params :contents
          optional_params :contents
        end
        request(:put, "permissionSets/#{id}", params)
      end

      # [DELETE] Delete a permission set assignment
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/PermissionSets/delete_permissionSets_id_assignments
      # @return [Paperdrive::Response]
      def delete_permission_set_assignment(id:, **args)
        params = parameters(args) do
          required_params :user_id
          optional_params :user_id
        end
        request(:delete, "permissionSets/#{id}/assignments", params)
      end
    end
  end
end
