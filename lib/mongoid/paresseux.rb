# encoding: utf-8
require 'mongoid'

module Mongoid
  module Paresseux
    extend ::ActiveSupport::Concern

    included do
      field :paresseux_version, type: Integer, default: self::VERSION
      after_initialize :paresseux_migrate
      before_save      :set_paresseux_version
    end

    private

    def paresseux_migrate
      if paresseux_version < current_paresseux_version
        "#{self.class}Paresseux".constantize.new(self, current_paresseux_version).migrate!
      end
    end

    def set_paresseux_version
      self.paresseux_version = current_paresseux_version
    end

    def current_paresseux_version
      self.class::VERSION
    end

  end # Paresseux
end # Mongoid
