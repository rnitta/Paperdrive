# frozen_string_literal: true

require 'paperdrive/connection'

module Paperdrive
  class Client
    module General
      include Paperdrive::Connection

      def general_get(path, params = {})
        get(path, params)
      end

      def general_post(path, params = {})
        post(path, params)
      end

      def general_put(path, params = {})
        put(path, params)
      end

      def general_delete(path, params = {})
        delete(path, params)
      end
    end
  end
end
