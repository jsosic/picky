# encoding: utf-8
#
require 'spec_helper'

describe "partial automatic splitting with small partials" do
  
  let(:index) do
    index = Picky::Index.new :automatic_text_splitting do
      indexing removes_characters: /[^a-z\s]/i,
               stopwords: /\b(in|a)\b/
      category :text,
                partial: Picky::Partial::Postfix.new(from: 1)
    end
    index.replace_from id: 1, text: 'Rainbow'
    index
  end

  context 'splitting the text automatically' do
    let(:automatic_splitter) {
      Picky::Splitters::Automatic.new index[:text], partial: true }
    
    # It splits the text correctly.
    #
    it do
      automatic_splitter.segment('rainbow', true).should == [
        ['rainbow'],
        0.0
      ]
    end
  end
  
  context 'splitting the text automatically' do
    let(:automatic_splitter) { Picky::Splitters::Automatic.new index[:text], partial: true }
    
    # It splits the text correctly.
    #
    it { automatic_splitter.split('rainbowrainbow').should == ['rainbow', 'rainbow'] }
    it { automatic_splitter.split('rainbowrain').should == ['rainbow', 'rain'] }
    it { automatic_splitter.split('rain').should == ['rain'] }
    
    # When it can't, it splits it using the partial index (correctly).
    #
    it { automatic_splitter.split('r').should == ['r'] }
    it { automatic_splitter.split('rr').should == ['r', 'r'] }
    it { automatic_splitter.split('rrr').should == ['r', 'r', 'r'] }
    it { automatic_splitter.split('rrrr').should  == ['r', 'r', 'r', 'r'] }
    
    it { automatic_splitter.split('rarara').should == ['ra', 'ra', 'ra'] }
    it { automatic_splitter.split('rainrairar').should  == ['rain', 'rai', 'ra', 'r'] }
  end

end