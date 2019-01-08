# frozen_string_literal: true

require 'paperdrive/connection'

module Paperdrive
  class Client
    module Activities
      include Paperdrive::Connection

      def all_activities(params = {})
        get('/activities', params)
      end

      def an_activity(id, params = {})
        get("/activities/#{id}", params)
      end

      def add_an_activity(params = {})
        post('/activities', params)
      end

      def edit_an_actibity(id, params = {})
        put("/activities/#{id}", params)
      end

      def delete_multiple_activities(params = {})
        delete('/activities', params)
      end

      def delete_an_activity(id, params = {})
        delete("/activities/#{id}", params)
      end
    end
  end
end
