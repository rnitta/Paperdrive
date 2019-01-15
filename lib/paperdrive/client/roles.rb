# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to Roles to embed into Paperdrive::Client<br>
    # arguments are compatible with the Pipedribe API.
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/Roles
    module Roles
      include Paperdrive::Parameters

      # [GET] Get all roles
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Roles/get_roles
      # @return [Paperdrive::Response]
      def all_roles(**args)
        params = parameters(args) do
          optional_params :start, :limit
        end
        request(:get, 'roles', params)
      end

      # [GET] Get one role
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Roles/get_roles_id
      # @return [Paperdrive::Response]
      def role(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:get, "roles/#{id}", params)
      end

      # [GET] List role assignments
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Roles/get_roles_id_assignments
      # @return [Paperdrive::Response]
      def role_assignments(id:, **args)
        params = parameters(args) do
          optional_params :start, :limit
        end
        request(:get, "roles/#{id}/assignments", params)
      end

      # [GET] List role sub-roles
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Roles/get_roles_id_roles
      # @return [Paperdrive::Response]
      def role_sub_roles(id:, **args)
        params = parameters(args) do
          optional_params :start, :limit
        end
        request(:get, "roles/#{id}/roles", params)
      end

      # [GET] List role settings
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Roles/get_roles_id_settings
      # @return [Paperdrive::Response]
      def role_settings(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:get, "roles/#{id}/settings", params)
      end

      # [POST] Add a role
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Roles/post_roles
      # @return [Paperdrive::Response]
      def create_role(**args)
        params = parameters(args) do
          required_params :name
          optional_params :parent_role_id, :name
        end
        request(:post, 'roles', params)
      end

      # [POST] Add role assignment
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Roles/post_roles_id_assignments
      # @return [Paperdrive::Response]
      def create_role_assignment(id:, **args)
        params = parameters(args) do
          required_params :user_id
          optional_params :user_id
        end
        request(:post, "roles/#{id}/assignments", params)
      end

      # [POST] Add or update role setting
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Roles/post_roles_id_settings
      # @return [Paperdrive::Response]
      def create_or_update_role_setting(id:, **args)
        params = parameters(args) do
          required_params :setting_key, :value
          optional_params :setting_key, :value
        end
        request(:post, "roles/#{id}/settings", params)
      end

      # [PUT] Update role details
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Roles/put_roles_id
      # @return [Paperdrive::Response]
      def update_role_details(id:, **args)
        params = parameters(args) do
          optional_params :parent_role_id, :name
        end
        request(:put, "roles/#{id}", params)
      end

      # [DELETE] Delete a role
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Roles/delete_roles_id
      # @return [Paperdrive::Response]
      def delete_role(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:delete, "roles/#{id}", params)
      end

      # [DELETE] Delete a role assignment
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Roles/delete_roles_id_assignments
      # @return [Paperdrive::Response]
      def delete_role_assignment(id:, **args)
        params = parameters(args) do
          required_params :user_id
          optional_params :user_id
        end
        request(:delete, "roles/#{id}/assignments", params)
      end
    end
  end
end
