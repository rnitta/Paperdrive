# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to Organizations to embed into Paperdrive::Client<br>
    # arguments are compatible with the Pipedribe API.
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/Organizations
    module Organizations
      include Paperdrive::Parameters

      # [GET] Get all organizations
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Organizations/get_organizations
      # @return [Paperdrive::Response]
      def all_organizations(**args)
        params = parameters(args) do
          optional_params :user_id, :filter_id, :first_char, :start, :limit, :sort
        end
        request(:get, 'organizations', params)
      end

      # [GET] Find organizations by name
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Organizations/get_organizations_find
      # @return [Paperdrive::Response]
      def find_organizations_by_name(**args)
        params = parameters(args) do
          required_params :term
          optional_params :term, :start, :limit
        end
        request(:get, 'organizations/find', params)
      end

      # [GET] Get details of an organization
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Organizations/get_organizations_id
      # @return [Paperdrive::Response]
      def organization_detail(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:get, "organizations/#{id}", params)
      end

      # [GET] List activities associated with an organization
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Organizations/get_organizations_id_activities
      # @return [Paperdrive::Response]
      def organization_activities(id:, **args)
        params = parameters(args) do
          optional_params :start, :limit, :done, :exclude
        end
        request(:get, "organizations/#{id}/activities", params)
      end

      # [GET] List deals associated with an organization
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Organizations/get_organizations_id_deals
      # @return [Paperdrive::Response]
      def organization_deals(id:, **args)
        params = parameters(args) do
          optional_params :start, :limit, :status, :sort, :only_primary_association
        end
        request(:get, "organizations/#{id}/deals", params)
      end

      # [GET] List files attached to an organization
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Organizations/get_organizations_id_files
      # @return [Paperdrive::Response]
      def organization_files(id:, **args)
        params = parameters(args) do
          optional_params :start, :limit, :include_deleted_files, :sort
        end
        request(:get, "organizations/#{id}/files", params)
      end

      # [GET] List updates about an organization
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Organizations/get_organizations_id_flow
      # @return [Paperdrive::Response]
      def organization_updates(id:, **args)
        params = parameters(args) do
          optional_params :start, :limit
        end
        request(:get, "organizations/#{id}/flow", params)
      end

      # [GET] List followers of an organization
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Organizations/get_organizations_id_followers
      # @return [Paperdrive::Response]
      def organization_followers(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:get, "organizations/#{id}/followers", params)
      end

      # [GET] List mail messages associated with an organization
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Organizations/get_organizations_id_mailMessages
      # @return [Paperdrive::Response]
      def organization_mail_messages(id:, **args)
        params = parameters(args) do
          optional_params :start, :limit
        end
        request(:get, "organizations/#{id}/mailMessages", params)
      end

      # [GET] List permitted users
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Organizations/get_organizations_id_permittedUsers
      # @return [Paperdrive::Response]
      def organization_permitted_users(id:, **args)
        params = parameters(args) do
          optional_params :access_level
        end
        request(:get, "organizations/#{id}/permittedUsers", params)
      end

      # [GET] List persons of an organization
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Organizations/get_organizations_id_persons
      # @return [Paperdrive::Response]
      def organization_persons(id:, **args)
        params = parameters(args) do
          optional_params :start, :limit
        end
        request(:get, "organizations/#{id}/persons", params)
      end

      # [POST] Add an organization
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Organizations/post_organizations
      # @return [Paperdrive::Response]
      def create_organization(**args)
        params = parameters(args) do
          required_params :name
          optional_params :name, :owner_id, :visible_to, :add_time
        end
        request(:post, 'organizations', params)
      end

      # [POST] Add a follower to an organization
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Organizations/post_organizations_id_followers
      # @return [Paperdrive::Response]
      def add_follower_to_organization(id:, **args)
        params = parameters(args) do
          required_params :user_id
          optional_params :user_id
        end
        request(:post, "organizations/#{id}/followers", params)
      end

      # [PUT] Update an organization
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Organizations/put_organizations_id
      # @return [Paperdrive::Response]
      def update_organization(id:, **args)
        params = parameters(args) do
          optional_params :name, :owner_id, :visible_to
        end
        request(:put, "organizations/#{id}", params)
      end

      # [PUT] Merge two organizations
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Organizations/put_organizations_id_merge
      # @return [Paperdrive::Response]
      def merge_organizations(id:, **args)
        params = parameters(args) do
          required_params :merge_with_id
          optional_params :merge_with_id
        end
        request(:put, "organizations/#{id}/merge", params)
      end

      # [DELETE] Delete multiple organizations in bulk
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Organizations/delete_organizations
      # @return [Paperdrive::Response]
      def delete_organizations(**args)
        params = parameters(args) do
          required_params :ids
          optional_params :ids
        end
        request(:delete, 'organizations', params)
      end

      # [DELETE] Delete an organization
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Organizations/delete_organizations_id
      # @return [Paperdrive::Response]
      def delete_organization(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:delete, "organizations/#{id}", params)
      end

      # [DELETE] Delete a follower from an organization
      #
      # @param [integer] id:
      # @param [integer] follower_id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Organizations/delete_organizations_id_followers_follower_id
      # @return [Paperdrive::Response]
      def delete_organization_follower(id:, follower_id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:delete, "organizations/#{id}/followers/#{follower_id}", params)
      end
    end
  end
end
