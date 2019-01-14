# frozen_string_literal: true

require 'active_support'
require 'active_support/core_ext'
require 'paperdrive/error'

module Paperdrive
  # Module which has methods to define parameters to submit with request
  module Parameters
    protected

    def parameters(params, &_block)
      @params = params.symbolize_keys
      yield if block_given?
      @params
    end

    # set required parameters and raise errors if there are lack of params
    def required_params(*args)
      raise InvalidRequiredParameters unless args.all? { |arg| arg.is_a?(Symbol) }
      raise MissingRequiredParameters unless args.all? { |arg| !@params[arg].nil? }
    end

    # set optional(possible) parameters and output redundant parameters to stdout
    def optional_params(*args)
      raise InvalidRequiredParameters unless args.all? { |arg| arg.is_a?(Symbol) }

      @params.keys.each do |key|
        puts ":#{key} is unused parameter." unless args.include?(key)
      end
      @params.slice!(*args)
    end
  end
end
