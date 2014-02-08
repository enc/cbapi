require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Cbapi
  describe API do

    let(:url) { "http://api.crunchbase.com/v/1/company/facebook.js" }
    let(:company) { File.open(File.join(File.dirname(__FILE__), "..","json","company.js")).read }

    context "without key" do

      it 'adds no key to easy url' do
        API.should_receive(:get_url).with(url).and_return(company)
        API.retrieve url
      end

      it 'has a key' do
        API.key = "12345678"
        expect(API.key).to eq "12345678"
      end
    end

    context "with key" do

      before { API.key = "vtbn6ju62cp2apg9mjmuva86" }
      let(:complex_url) { "http://api.crunchbase.com/v/1/search.js?query=instagram&entity=product" }

      it 'adds key to easy url' do
        API.should_receive(:get_url).with(url+"?api_key=vtbn6ju62cp2apg9mjmuva86").and_return(company)
        API.retrieve url
      end
      it 'adds key to complex url' do
        API.should_receive(:get_url).with(complex_url+"&api_key=vtbn6ju62cp2apg9mjmuva86").and_return(company)
        API.retrieve complex_url
      end

      it 'returns JSON from URL' do
        API.should_receive(:get_url).with(url+"?api_key=vtbn6ju62cp2apg9mjmuva86").and_return(company)
        expect(API.retrieve(url)).to eq(JSON.parse(company))
      end
    end

  end
end
