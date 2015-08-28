require 'test_helper'

describe CptecInpe do
  let(:city_code) { 123 }
  let(:client) { CptecInpe.new city_code }

  it "version must be defined" do
    CptecInpe::VERSION.wont_be_nil
  end

  describe "Client" do
    it "must set location" do
      CptecInpe.new(city_code).location.must_equal city_code
    end

    it "must fetch today waves forecast" do
      client.today_waves city_code
    end

    it "must fetch next days waves forecast" do
      client.next_days_waves city_code
    end

    it "must fetch today weather forecast" do
      client.today
    end

    it "must fetch next days weather forecast" do
      client.next_days
    end
  end
end
