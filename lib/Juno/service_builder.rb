module Juno
  module ServiceBuilder
    extend ActiveSupport::Concern

    included do
      attr_reader :params
    end

    module ClassMethods
      def call(*args)
        new(*args).call
      end
    end

    def errors
      @errors ||= []
    end

    def _params(params)
      if params.respond_to?(:to_unsafe_hash)
        params.to_unsafe_hash.deep_symbolize_keys
      else
        params
      end
    end
  end
end