require 'active_record'

module Juno
  module ActiveRecordBuilder
    extend ActiveSupport::Concern

    included do
      attr_reader :errors
    end

    def transact!
      ActiveRecord::Base.transaction {yield}
    rescue => e
      errors.push e.message
      on_call_error(e) if respond_to?(:on_call_error)
      return false
    end
  end
end
