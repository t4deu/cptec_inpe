require "cptec_inpe/version"
require "cptec_inpe/utils"
require "httparty"

class CptecInpe
  include HTTParty

  base_uri "servicos.cptec.inpe.br"

  attr_reader :location_code

  def initialize(str)
    self.location = str unless str.nil?
  end

  def location=(location)
    @location_code = nil

    city = find_location(location)

    unless city.nil?
      @location_code = city["id"]
    end
  end

  def find_location(location)
    options = {
      query: {
        city: Utils.normalize(location)
      }
    }

    path = build_path "/listaCidades"
    cities = self.class.get(path, options)["cidades"]

    return if cities.nil?
    return cities["cidade"].first if cities["cidade"].is_a?(Array)

    cities["cidade"]
  end

  def waves_today
    response = get("/cidade/%s/dia/0/ondas.xml")
    response["cidade"] if response
  end

  def waves_next_days
    response = get("/cidade/%s/todos/tempos/ondas.xml")
    get_forecast(response) if response
  end

  def forecast
    response = get("/cidade/%s/previsao.xml")
    get_forecast(response) if response
  end

  private

  def get(path_format)
    unless @location_code.nil?
      path = build_path(path_format % @location_code)
      response = self.class.get(path)
      response if response.success?
    end
  end

  def build_path(path)
    "/XML#{path}"
  end

  def get_forecast(response)
    response["cidade"]["previsao"]
  end
end
