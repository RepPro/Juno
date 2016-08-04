require 'active_record'

module Juno
  module ActiveRecordBuilder
    def transact!
      ActiveRecord::Base.transaction {yield}
    rescue => e
      errors.push e.message
      return false
    end
  end
end