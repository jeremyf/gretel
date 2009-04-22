require File.dirname(__FILE__) + '/../test_helper'

class Gretel::BuilderTest < Test::Unit::TestCase
  def setup
    @breadcrumb_trail = Gretel.new('/widgets/1')
    @breadcrumb_trail.stubs(:extract_model_from_path).returns(nil)
  end
  
  def test_should_parse_the_request
    @breadcrumb_trail.stubs(:extract_model_from_path).with('/widgets/1').returns('widget named sue')
    assert_equal(@breadcrumb_trail.to_s.no_whitespace, %(
    <div id="breadcrumb_trail">
    <p><a href='/'>home</a> &raquo; <a href="/widgets">widgets</a> &raquo; <a href="/widgets/1">widget named sue</a></p>
    </div>
    ).no_whitespace)
  end
  
  def test_should_allow_dom_id_to_be_overwritten
    @breadcrumb_trail = Gretel::Builder.new('/path/home', :dom_id => 'patunia')
    assert_match(/<div[^\>]*id="patunia"/,@breadcrumb_trail.to_s )
  end
  
  def test_should_allow_separator_to_be_overwritten
    @breadcrumb_trail = Gretel::Builder.new('/path', :separator => '*-*')
    assert_match(/#{Regexp.escape('> *-* <')}/, @breadcrumb_trail.to_s)
  end
end
