require 'pathname'
require Pathname(__FILE__).dirname.join('..','..','spec_helper').expand_path

require 'gscraper/extensions/uri'

describe "URI::QueryParams" do
  before(:each) do
    @uri = URI('http://www.test.com/page.php?x=1&y=one%20two&z')
  end

  it "should provide #query_params" do
    @uri.should respond_to(:query_params)
  end

  it "#query_params should be a Hash" do
    @uri.query_params.class.should == Hash
  end

  it "#query_params should contain params" do
    @uri.query_params.empty?.should == false
  end

  it "#query_params can contain single-word params" do
    @uri.query_params['x'].should == '1'
  end

  it "#query_params can contain multi-word params" do
    @uri.query_params['y'].should == 'one two'
  end

  it "#query_params can contain empty params" do
    @uri.query_params['z'].should be_nil
  end

  it "should update #query_params along with #query=" do
    @uri.query = 'u=3'
    @uri.query_params['u'].should == '3'
  end
end
