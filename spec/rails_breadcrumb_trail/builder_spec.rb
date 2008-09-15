require File.dirname(__FILE__) + '/../spec_helper'

describe 'RailsBreadcrumbTrail::Builder' do
  before(:each) do
    @breadcrumb_trail = RailsBreadcrumbTrail::Builder.new('/widgets/1')
    @breadcrumb_trail.stub!(:extract_model_from_path).and_return(nil)
  end

  it 'should parse the request' do
    @breadcrumb_trail.stub!(:extract_model_from_path).with('/widgets/1').and_return('widget named sue')
    @breadcrumb_trail.to_s.no_whitespace.should == %(
    <div id="breadcrumb_trail">
    <p><a href='/'>home</a> &raquo; <a href="/widgets">widgets</a> &raquo; <a href="/widgets/1">widget named sue</a></p>
    </div>
    ).no_whitespace
  end

  it 'it should allow dom_id to be overwritten' do
    @breadcrumb_trail = RailsBreadcrumbTrail::Builder.new('/path/home', :dom_id => 'patunia')
    @breadcrumb_trail.to_s.should match(/<div[^\>]*id="patunia"/)
  end

  it 'it should allow separator to be overwritten' do
    @breadcrumb_trail = RailsBreadcrumbTrail::Builder.new('/path', :separator => '*-*')
    @breadcrumb_trail.to_s.should match(/#{Regexp.escape('> *-* <')}/)
  end
end
