# frozen_string_literal: true

require 'paperdrive/parameters'

module Paperdrive
  class Client
    # Instance methods related to NoteFields to embed into Paperdrive::Client
    #
    # @see https://developers.pipedrive.com/docs/api/v1/#!/NoteFields
    module NoteFields
      include Paperdrive::Parameters

      # [GET] fetch all fields for note.
      #
      # @see https://developers.pipedrive.com/docs/api/v1/#!/NoteFields/get_noteFields
      # @return [Paperdrive::Response]
      def all_note_fields(**args)
        params = parameters(args) do
          optional_params
        end
        request(:get, 'noteFields', params)
      end
    end
  end
end
