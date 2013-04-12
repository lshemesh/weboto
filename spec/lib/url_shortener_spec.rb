require 'spec_helper'

describe UrlShortener do
  let(:long_url) { "https://panda.com/super/long_url/for_no?reason=atall" }
  let(:short_url) { "http://google.com" }


  describe '#short_url' do
    context 'given a URL greater than 20 chars' do
      let(:url_shortener) { UrlShortener.new(long_url) }
      let(:io) { StringIO.new(short_url) }

      before(:each) do
        url_shortener.stub!(:open => io)
      end

      it 'shortens it' do
        url_shortener.short_url.should == short_url
      end
    end

    context 'given a URL less than 20 chars' do
      let(:url_shortener) { UrlShortener.new(short_url) }

      it 'returns the URL' do
        url_shortener.short_url.should == short_url
      end
    end
  end
end
