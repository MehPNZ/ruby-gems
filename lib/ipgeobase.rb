# frozen_string_literal: true

require_relative 'ipgeobase/version'
require_relative 'ipgeobase/ip'
require 'addressable/uri'
require 'net/http'
# DEGIN
module Ipgeobase
  CURL = 'http://ip-api.com/xml/'

  class Error < StandardError; end

  def self.lookup(adress)
    ip_adress = Addressable::URI.parse("#{CURL}#{adress}")
    res = Net::HTTP.get(ip_adress)
    Ip::InfoIp.parse(res)
  end
end
# END
