require 'active_support/all'
require 'sqsender/config'
require 'pry' #FIXME remove

module Sqsender
  def self.config
    Config.instance
  end

  def self.env
    ENV["ENV"] || "development"
  end

  def self.start
    # load initializers
    Dir[File.expand_path("#{__dir__}/../config/initializers/**/*.rb")].each { |f| require f }
  end
end

Sqsender.start
