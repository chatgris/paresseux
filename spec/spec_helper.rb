# encoding: utf-8
path = File.expand_path(File.dirname(__FILE__) + '/../lib/')
$LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)

require 'paresseux'

Mongoid.configure do |config|
  config.master = Mongo::Connection.new.db('paresseux_spec')
end

RSpec.configure do |config|
  config.after :each do
    Mongoid.master.collections.reject { |c| c.name =~ /^system\./ }.each(&:drop)
  end
end
