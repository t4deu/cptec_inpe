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

    path = "#{base_path}/listaCidades"
    cities = self.class.get(path, options)["cidades"]

    return if cities.nil?
    return cities["cidade"].first if cities["cidade"].is_a?(Array)

    cities["cidade"]
  end

  def waves_today
    response = get("#{base_path}/cidade/%s/dia/0/ondas.xml")
    response["cidade"] if response
  end

  def waves_next_days
    response = get("#{base_path}/cidade/%s/todos/tempos/ondas.xml")
    response["cidade"]["previsao"] if response
  end

  def forecast
    response = get("#{base_path}/cidade/%s/previsao.xml")
    response["cidade"]["previsao"] if response
  end

  private

  def base_path
    "/XML"
  end

  def get(path_format)
    unless @location_code.nil?
      response = self.class.get(path_format % @location_code)
      response if response.success?
    end
  end
end
