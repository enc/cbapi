require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Cbapi
  describe Search do
    let(:list_company) { File.open(File.join(File.dirname(__FILE__), "..","json","lcomp.js")).read }
    it 'can search CB' do
        API.should_receive(:retrieve).at_least(:once).with("http://api.crunchbase.com/v/1/search.js?query=facebook&page=1").and_return(JSON.parse(list_company))

        result = subject.search("facebook")
        expect(result).to be_an(Array)
      end

      it 'finds facebook' do
        API.should_receive(:retrieve).at_least(:once).with("http://api.crunchbase.com/v/1/search.js?query=facebook&page=1").and_return(JSON.parse(list_company))

        result = subject.search("facebook")
        expect(result[0]["name"]).to eq("Facebook")
      end


  end
end
