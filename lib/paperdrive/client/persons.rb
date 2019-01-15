# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to Persons to embed into Paperdrive::Client<br>
    # arguments are compatible with the Pipedribe API.
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/Persons
    module Persons
      include Paperdrive::Parameters

      # [GET] Get all persons
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Persons/get_persons
      # @return [Paperdrive::Response]
      def all_persons(**args)
        params = parameters(args) do
          optional_params :user_id, :filter_id, :first_char, :start, :limit, :sort
        end
        request(:get, 'persons', params)
      end

      # [GET] Find persons by name
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Persons/get_persons_find
      # @return [Paperdrive::Response]
      def find_persons_by_name(**args)
        params = parameters(args) do
          required_params :term
          optional_params :term, :org_id, :start, :limit, :search_by_email
        end
        request(:get, 'persons/find', params)
      end

      # [GET] Get details of a person
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Persons/get_persons_id
      # @return [Paperdrive::Response]
      def person(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:get, "persons/#{id}", params)
      end

      # [GET] List activities associated with a person
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Persons/get_persons_id_activities
      # @return [Paperdrive::Response]
      def person_activities(id:, **args)
        params = parameters(args) do
          optional_params :start, :limit, :done, :exclude
        end
        request(:get, "persons/#{id}/activities", params)
      end

      # [GET] List deals associated with a person
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Persons/get_persons_id_deals
      # @return [Paperdrive::Response]
      def person_deals(id:, **args)
        params = parameters(args) do
          optional_params :start, :limit, :status, :sort
        end
        request(:get, "persons/#{id}/deals", params)
      end

      # [GET] List files attached to a person
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Persons/get_persons_id_files
      # @return [Paperdrive::Response]
      def person_files(id:, **args)
        params = parameters(args) do
          optional_params :start, :limit, :include_deleted_files, :sort
        end
        request(:get, "persons/#{id}/files", params)
      end

      # [GET] List updates about a person
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Persons/get_persons_id_flow
      # @return [Paperdrive::Response]
      def person_updates(id:, **args)
        params = parameters(args) do
          optional_params :start, :limit
        end
        request(:get, "persons/#{id}/flow", params)
      end

      # [GET] List followers of a person
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Persons/get_persons_id_followers
      # @return [Paperdrive::Response]
      def person_followers(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:get, "persons/#{id}/followers", params)
      end

      # [GET] List mail messages associated with a person
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Persons/get_persons_id_mailMessages
      # @return [Paperdrive::Response]
      def person_mail_messages(id:, **args)
        params = parameters(args) do
          optional_params :start, :limit
        end
        request(:get, "persons/#{id}/mailMessages", params)
      end

      # [GET] List permitted users
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Persons/get_persons_id_permittedUsers
      # @return [Paperdrive::Response]
      def person_permitted_users(id:, **args)
        params = parameters(args) do
          optional_params :access_level
        end
        request(:get, "persons/#{id}/permittedUsers", params)
      end

      # [GET] List products associated with a person
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Persons/get_persons_id_products
      # @return [Paperdrive::Response]
      def person_products(id:, **args)
        params = parameters(args) do
          optional_params :start, :limit
        end
        request(:get, "persons/#{id}/products", params)
      end

      # [POST] Add a person
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Persons/post_persons
      # @return [Paperdrive::Response]
      def create_person(**args)
        params = parameters(args) do
          required_params :name
          optional_params :name, :owner_id, :org_id, :email, :phone, :visible_to, :add_time
        end
        request(:post, 'persons', params)
      end

      # [POST] Add a follower to a person
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Persons/post_persons_id_followers
      # @return [Paperdrive::Response]
      def create_person_follower(id:, **args)
        params = parameters(args) do
          required_params :user_id
          optional_params :user_id
        end
        request(:post, "persons/#{id}/followers", params)
      end

      # [POST] Add person picture
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Persons/post_persons_id_picture
      # @return [Paperdrive::Response]
      # def create_person_picture(id:, **args)
      #   params = parameters(args) do
      #     required_params :file
      #     optional_params :file, :crop_x, :crop_y, :crop_width, :crop_height
      #   end
      #   request(:post, "persons/#{id}/picture", params)
      # end

      # [PUT] Update a person
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Persons/put_persons_id
      # @return [Paperdrive::Response]
      def update_person(id:, **args)
        params = parameters(args) do
          optional_params :name, :owner_id, :org_id, :email, :phone, :visible_to
        end
        request(:put, "persons/#{id}", params)
      end

      # [PUT] Merge two persons
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Persons/put_persons_id_merge
      # @return [Paperdrive::Response]
      def merge_persons(id:, **args)
        params = parameters(args) do
          required_params :merge_with_id
          optional_params :merge_with_id
        end
        request(:put, "persons/#{id}/merge", params)
      end

      # [DELETE] Delete multiple persons in bulk
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Persons/delete_persons
      # @return [Paperdrive::Response]
      def delete_persons(**args)
        params = parameters(args) do
          required_params :ids
          optional_params :ids
        end
        request(:delete, 'persons', params)
      end

      # [DELETE] Delete a person
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Persons/delete_persons_id
      # @return [Paperdrive::Response]
      def delete_person(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:delete, "persons/#{id}", params)
      end

      # [DELETE] Delete a follower from a person
      #
      # @param [integer] id:
      # @param [integer] follower_id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Persons/delete_persons_id_followers_follower_id
      # @return [Paperdrive::Response]
      def delete_person_follower(id:, follower_id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:delete, "persons/#{id}/followers/#{follower_id}", params)
      end

      # [DELETE] Delete person picture
      #
      # @param [integer] id:
      # @see https://developers.pipedrive.com/docs/api/v1/#!/Persons/delete_persons_id_picture
      # @return [Paperdrive::Response]
      def delete_person_picture(id:, **args)
        params = parameters(args) do
          optional_params
        end
        request(:delete, "persons/#{id}/picture", params)
      end
    end
  end
end
