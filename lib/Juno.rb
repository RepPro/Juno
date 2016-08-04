require "Juno/version"
require "Juno/active_record_builder"
require "Juno/service_builder"

module Juno
  def self.service
    Juno::ServiceBuilder
  end

  def self.active_record
    Juno::ActiveRecordBuilder
  end

end
