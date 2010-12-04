require 'spec_helper'

describe Indexed::Index do
  
  context "with categories" do
    before(:each) do
      @categories = stub :categories
      
      @index = Indexed::Index.new :some_name
      @index.define_category :some_category_name1
      @index.define_category :some_category_name2
      
      @index.stub! :categories => @categories
    end

    describe "load_from_cache" do
      it "delegates to each category" do
        @categories.should_receive(:load_from_cache).once.with
        
        @index.load_from_cache
      end
    end
    describe "possible_combinations" do
      it "delegates to the combinator" do
        @categories.should_receive(:possible_combinations_for).once.with :some_token
        
        @index.possible_combinations :some_token
      end
    end
  end
  
  context "no categories" do
    it "works" do
      Indexed::Index.new :some_name
    end
  end
  
end