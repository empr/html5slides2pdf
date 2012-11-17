require 'spec_helper'

describe Html5slides2pdf do
  before(:each) { @obj = Html5slides2pdf.new }

  describe '#new' do
    subject { @obj }
    its(:output) { should == '_slide.pdf' }
    its(:work_dir) { should == './work' }
    its(:options) { should == Html5slides2pdf::DEFAULT_OPTIONS }
  end

  describe '#slide?' do
    context 'valid input' do
      before {
        html = '<html><body><section><article></article></section>' \
               '<script src="slides.js"></script></body></html>'
        @doc = Nokogiri::HTML(html)
      }
      subject { @obj.slide? @doc }
      it { should == true }
    end

    context 'no section tag' do
      before {
        html = '<html><body><article></article>' \
               '<script src="slides.js"></script></body></html>'
        @doc = Nokogiri::HTML(html)
      }
      subject { @obj.slide? @doc }
      it { should == false }
    end

    context 'no article tag' do
      before {
        html = '<html><body><section></section>' \
               '<script src="slides.js"></script></body></html>'
        @doc = Nokogiri::HTML(html)
      }
      subject { @obj.slide? @doc }
      it { should == false }
    end

    context 'no "slides.js"' do
      before {
        html = '<html><body><section><article></article></section>' \
               '<script src="_slides.js"></script></body></html>'
        @doc = Nokogiri::HTML(html)
      }
      subject { @obj.slide? @doc }
      it { should == false }
    end
  end
end
