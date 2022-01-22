require "mongoid"

module AppConfigurator
  class << self
    def setup_database(env = :development)
      Mongoid.load!(File.join("config", "mongoid.yml"), env)
    end
  end
end