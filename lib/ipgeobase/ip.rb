# frozen_string_literal: true

require 'happymapper'

module Ip
  class InfoIp
    include HappyMapper

    tag 'query'
    element :city, String
    element :country, String
    element :countryCode, String
    element :lat, Float
    element :lon, Float
  end
end
