# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to Users to embed into Paperdrive::Client<br>
    # arguments are compatible with the Pipedribe API.
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/Users
    module Users
      include Paperdrive::Parameters

      # [GET] Get all users
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Users/get_users
      # @return [Paperdrive::Response]
      def all_users(**args)
        params = parameters(args) do
          optional_params
        end
        request(:get, 'users', params)
      end

      # [GET] Find users by name
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Users/get_users_find
      # @return [Paperdrive::Response]
      def find_users_by_name(**args)
        params = parameters(args) do
          required_params :term
          optional_params :term, :search_by_email
        end
        request(:get, 'users/find', params)
      end

      # [GET] Get current user data
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Users/get_users_me
      # @return [Paperdrive::Response]
      def current_user(**args)
        params = parameters(args) do
          optional_params
        end
        request(:get, 'users/me', params)
      end

      # [GET] Get one user
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Users/get_users_id
      # @return [Paperdrive::Response]
      def user(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:get, "users/#{id}", params)
      end

      # [GET] List and filter activities assigned to a specific user
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Users/get_users_id_activities
      # @return [Paperdrive::Response]
      def user_activities(id:, **args)
        params = parameters(args) do
          optional_params :due_date, :type, :start, :limit, :done
        end
        request(:get, "users/#{id}/activities", params)
      end

      # [GET] List blacklisted email addresses of a user
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Users/get_users_id_blacklistedEmails
      # @return [Paperdrive::Response]
      def user_blacklisted_emails(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:get, "users/#{id}/blacklistedEmails", params)
      end

      # [GET] List followers of a user
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Users/get_users_id_followers
      # @return [Paperdrive::Response]
      def user_followers(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:get, "users/#{id}/followers", params)
      end

      # [GET] List permission set assignments
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Users/get_users_id_permissionSetAssignments
      # @return [Paperdrive::Response]
      def user_permission_set_assignments(id:, **args)
        params = parameters(args) do
          optional_params :start, :limit
        end
        request(:get, "users/#{id}/permissionSetAssignments", params)
      end

      # [GET] List user permissions
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Users/get_users_id_permissions
      # @return [Paperdrive::Response]
      def user_permissions(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:get, "users/#{id}/permissions", params)
      end

      # [GET] List role assignments
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Users/get_users_id_roleAssignments
      # @return [Paperdrive::Response]
      def user_role_assignments(id:, **args)
        params = parameters(args) do
          optional_params :start, :limit
        end
        request(:get, "users/#{id}/roleAssignments", params)
      end

      # [GET] List user role settings
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Users/get_users_id_roleSettings
      # @return [Paperdrive::Response]
      def user_role_settings(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:get, "users/#{id}/roleSettings", params)
      end

      # [POST] Add a new user
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Users/post_users
      # @return [Paperdrive::Response]
      def create_user(**args)
        params = parameters(args) do
          required_params :name, :email, :active_flag
          optional_params :name, :email, :active_flag
        end
        request(:post, 'users', params)
      end

      # [POST] Add blacklisted email address for a user
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Users/post_users_id_blacklistedEmails
      # @return [Paperdrive::Response]
      def create_user_blacklisted_email(id:, **args)
        params = parameters(args) do
          required_params :address
          optional_params :address
        end
        request(:post, "users/#{id}/blacklistedEmails", params)
      end

      # [POST] Add permission set assignment
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Users/post_users_id_permissionSetAssignments
      # @return [Paperdrive::Response]
      def create_user_permission_set_assignment(id:, **args)
        params = parameters(args) do
          required_params :permission_set_id
          optional_params :permission_set_id
        end
        request(:post, "users/#{id}/permissionSetAssignments", params)
      end

      # [POST] Add role assignment
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Users/post_users_id_roleAssignments
      # @return [Paperdrive::Response]
      def create_user_role_assignment(id:, **args)
        params = parameters(args) do
          required_params :role_id
          optional_params :role_id
        end
        request(:post, "users/#{id}/roleAssignments", params)
      end

      # [PUT] Update user details
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Users/put_users_id
      # @return [Paperdrive::Response]
      def update_user(id:, **args)
        params = parameters(args) do
          required_params :active_flag
          optional_params :active_flag
        end
        request(:put, "users/#{id}", params)
      end

      # [DELETE] Delete a permission set assignment
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Users/delete_users_id_permissionSetAssignments
      # @return [Paperdrive::Response]
      def delete_user_permission_set_assignment(id:, **args)
        params = parameters(args) do
          required_params :permission_set_id
          optional_params :permission_set_id
        end
        request(:delete, "users/#{id}/permissionSetAssignments", params)
      end

      # [DELETE] Delete a role assignment
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Users/delete_users_id_roleAssignments
      # @return [Paperdrive::Response]
      def delete_user_role_assignment(id:, **args)
        params = parameters(args) do
          required_params :role_id
          optional_params :role_id
        end
        request(:delete, "users/#{id}/roleAssignments", params)
      end
    end
  end
end
