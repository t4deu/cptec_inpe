require "spec_helper"

describe CptecInpe do
  it "version must be defined" do
    CptecInpe::VERSION.wont_be_nil
  end

  describe "Client" do
    describe "location is valid" do
      let(:client) { CptecInpe.new "João Pessoa" }

      it "must set location" do
        client.location_code.wont_be_nil
      end

      it "can change location" do
        client.location = "São Paulo"
        client.location_code.wont_be_nil

        client.location = "João Pessoa"
        client.location_code.wont_be_nil
      end

      it "must fetch today waves forecast" do
        client.waves_today["manha"]["dia"].wont_be_empty
      end

      it "must fetch next days waves forecast" do
        client.waves_next_days.first["dia"].wont_be_empty
      end

      it "must fetch weather forecast" do
        client.forecast.first["dia"].wont_be_empty
      end
    end

    describe "location is invalid" do
      let(:client) { CptecInpe.new "Cuité do sul da pororoca" }

      it "won't set location" do
        client.location_code.must_be_nil
      end

      it "won't fetch today waves forecast" do
        client.waves_today.must_be_nil
      end

      it "won't fetch next days waves forecast" do
        client.waves_next_days.must_be_nil
      end

      it "won't fetch weather forecast" do
        client.forecast.must_be_nil
      end
    end
  end

  describe "location is not seaside" do
    let(:client) { CptecInpe.new "Brasília" }

    it "won't fetch today waves forecast" do
      client.waves_today.must_be_nil
    end

    it "won't fetch next days waves forecast" do
      client.waves_next_days.must_be_nil
    end
  end
end
