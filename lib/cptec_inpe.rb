require "cptec_inpe/version"
require 'httparty'

class CptecInpe
  include HTTParty

  attr_accessor :location

  base_uri "servicos.cptec.inpe.br"

  def initialize(location)
    @location = location
  end

  def waves_today
    path = "#{base_path}/cidade/#{@location}/dia/0/ondas.xml"
    self.class.get(path)
  end

  def waves_next_days
    path = "#{base_path}/cidade/#{@location}/todos/tempos/ondas.xml"
    self.class.get(path)
  end

  def forecast
    path = "#{base_path}/cidade/#{@location}/previsao.xml"
    self.class.get(path)
  end

  private

  def base_path
    "/XML"
  end
end
