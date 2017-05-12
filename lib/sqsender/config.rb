require 'singleton'
require 'erb'
require 'yaml'

module Sqsender
  class Config
    include Singleton

    def options
      options_load.fetch(environment)
    end

    protected

    def environment
      Sqsender.env
    end

    def options_load
      @options_load ||= load_yaml('config.yml')
    end

    def config_dir
      File.expand_path('../../config', __dir__)
    end

    def load_yaml(filename)
      file = File.read(File.join(config_dir, filename))
      compiled_file = ERB.new(file).result
      YAML.load(compiled_file)
    end
  end
end
