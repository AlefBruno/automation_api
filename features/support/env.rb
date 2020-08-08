require 'rspec'
require 'httparty'
require 'pry'
require 'faker'

Dir[File.join(File.dirname(__FILE__), 'common/*.rb')].sort.each { |file| require_relative file }
Dir[File.join(File.dirname(__FILE__), 'spec_instances/**/*.rb')].sort.each { |file| require file }

World(Commons)

def load_yaml_file(path)
  YAML.load_file(File.dirname(__FILE__) + path)
end

CONFIG_API = load_yaml_file('/config/environment.yml')
MSG_API = load_yaml_file('/config/message.yml')
