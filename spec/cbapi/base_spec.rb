require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Cbapi
  describe Base do
    context 'company' do
      subject { class TestCompany < Base;
      set_entity('company');end; TestCompany.new }
      it 'create company url' do
        expect(subject).to be_a(TestCompany)
        expect(subject.get_url("john")).to eq("http://api.crunchbase.com/v/1/company/john.js")
        expect(subject.get_url("fritz")).to eq("http://api.crunchbase.com/v/1/company/fritz.js")
      end

      context "get content" do
        let(:company) { File.open(File.join(File.dirname(__FILE__), "..","json","company.js")).read }
        it "defines it property" do

          subject.class.define_property :name
          expect(subject).to respond_to(:name)
        end
        it "get data" do
          API.should_receive(:retrieve).at_least(:once).with("http://api.crunchbase.com/v/1/company/facebook.js").and_return(JSON.parse(company))
          subject.class.define_property :name
          subject.get("facebook")
          expect(subject.name).to eq("Facebook")
        end
        it 'can be created with content' do
          ba = Base.new company
          expect(ba.entity).to eq(company)
        end

        it 'has images' do
          API.should_receive(:retrieve).at_least(:once).with("http://api.crunchbase.com/v/1/company/facebook.js").and_return(JSON.parse(company))
          subject.get "facebook"
          expect(subject.images).to be_an(Array)
          expect(subject.images[2]).to eq("http://www.crunchbase.com/assets/images/resized/0000/4561/4561v1-max-450x450.png")
          expect(subject.images[0]).to eq("http://www.crunchbase.com/assets/images/resized/0000/4561/4561v1-max-150x150.png")
        end

      end
    end
    context 'product' do
      subject { class TestProduct < Base;set_entity('product');end; TestProduct.new }
      it 'create company url' do
        expect(subject).to be_a(TestProduct)
        expect(subject.get_url("john")).to eq("http://api.crunchbase.com/v/1/product/john.js")
        expect(subject.get_url("fritz")).to eq("http://api.crunchbase.com/v/1/product/fritz.js")
      end
    end

  end
end
