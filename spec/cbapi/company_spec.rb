module Cbapi
  describe Company do
    context 'create from blank' do
      let(:company_url) { "http://api.crunchbase.com/v/1/company/facebook.js" }
      it 'has the right url' do
        expect(subject).to respond_to(:name)
        expect(subject).to respond_to(:overview)
        expect(subject.get_url("<>/<>.js", "facebook")).to eq(company_url)
      end

    end
  end
end
