require 'spec_helper'

describe CptecInpe do
  let(:city_code) { 231 }
  let(:client) { CptecInpe.new city_code }

  it "version must be defined" do
    CptecInpe::VERSION.wont_be_nil
  end

  describe "Client" do
    it "must set location" do
      CptecInpe.new(city_code).location.must_equal city_code
    end

    it "must fetch today waves forecast" do
      client.waves_today['cidade'].wont_be_empty
    end

    it "must fetch next days waves forecast" do
      client.waves_next_days['cidade'].wont_be_empty
    end

    it "must fetch weather forecast" do
      client.forecast['cidade'].wont_be_empty
    end
  end
end
