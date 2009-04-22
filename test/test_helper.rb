require 'test/unit'
require 'rubygems'
require File.dirname(__FILE__) + '/../lib/gretel'
require 'mocha'
require 'stubba'

class String
  def no_whitespace
    gsub(/(\ |\n|\r)/, '')
  end
end