# encoding: utf-8
module Paresseux
  class Migration
    attr_reader :model, :version, :current_version

    def initialize(model, version)
      @model, @version, @current_version = model, version, model.paresseux_version
    end

    def migrate
      (current_version...version).each do |index|
        send("migration_#{index}_to_#{index + 1}")
      end
    end

    def migrate!
      migrate
      model.save
    end
  end # Migration
end # Paresseux
