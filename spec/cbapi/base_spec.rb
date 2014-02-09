require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Cbapi
  describe Base do
    it 'create company url' do
      subject.set_entity('company')
      expect(subject.get_url("john")).to eq("http://api.crunchbase.com/v/1/company/john.js")
      expect(subject.get_url("fritz")).to eq("http://api.crunchbase.com/v/1/company/fritz.js")
    end
    it 'create product url' do
      subject.set_entity('product')
      expect(subject.get_url("john")).to eq("http://api.crunchbase.com/v/1/product/john.js")
      expect(subject.get_url("fritz")).to eq("http://api.crunchbase.com/v/1/product/fritz.js")
    end

    it 'can handle more paramter'do
      subject.cb_url("<>/<>.js")
      expect(subject.get_url("product","john")).to eq("http://api.crunchbase.com/v/1/product/john.js")
    end

    context "get content" do
      let(:company) { File.open(File.join(File.dirname(__FILE__), "..","json","company.js")).read }
      it "defines it property" do

        subject.define_property :name
        expect(subject).to respond_to(:name)
      end
      it "get data" do
        API.should_receive(:retrieve).at_least(:once).with("http://api.crunchbase.com/v/1/company/facebook.js").and_return(JSON.parse(company))
        subject.cb_url("company/<>.js")
        subject.define_property :name
        subject.get("facebook")
        expect(subject.name).to eq("Facebook")
      end
      it 'can be created with content' do
        ba = Base.new company
        expect(ba.entity).to eq(company)
      end

    end

  end
end
