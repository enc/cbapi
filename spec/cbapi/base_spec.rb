require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

module Cbapi
  describe Base do
    it 'create company url' do
      subject.cb_url("company/<>.js")
      expect(subject.get_url("john")).to eq("http://api.crunchbase.com/v/1/company/john.js")
      expect(subject.get_url("fritz")).to eq("http://api.crunchbase.com/v/1/company/fritz.js")
    end
    it 'create product url' do
      subject.cb_url("product/<>.js")
      expect(subject.get_url("john")).to eq("http://api.crunchbase.com/v/1/product/john.js")
      expect(subject.get_url("fritz")).to eq("http://api.crunchbase.com/v/1/product/fritz.js")
    end

    it 'creates url with api' do
      subject.cb_url("product/<>.js")
      subject.api_key  "vtbn6ju62cp2apg9mjmuva86"
      expect(subject.get_url("john")).to eq("http://api.crunchbase.com/v/1/product/john.js?api_key=vtbn6ju62cp2apg9mjmuva86")
    end

    it 'can handle more paramter'do
      subject.cb_url("<>/<>.js")
      expect(subject.get_url("product","john")).to eq("http://api.crunchbase.com/v/1/product/john.js")
    end
  end
end
