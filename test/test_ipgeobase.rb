# frozen_string_literal: true
require "test_helper"
require_relative '../lib/ipgeobase'

class TestIpgeobase < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end


  def test_ipgeobase
    body = "<query>
    <status>success</status>
    <country>Russia</country>
    <countryCode>RU</countryCode>
    <region>SPE</region>
    <regionName>St.-Petersburg</regionName>
    <city>St Petersburg</city>
    <zip>190000</zip>
    <lat>59.8983</lat>
    <lon>30.2618</lon>
    <timezone>Europe/Moscow</timezone>
    <isp>MTS PJSC</isp>
    <org>MTS Penza</org>
    <as>AS35728 MTS PJSC</as>
    <query>82.209.106.182</query>
    </query>"

    stub_request(:get, "http://ip-api.com/xml/82.209.106.182").
  to_return(status: 200, body: body, headers: {})
    
    ip_meta = Ipgeobase.lookup('82.209.106.182')
    
    assert_equal ip_meta.countryCode, "RU"
    assert_equal ip_meta.country, 'Russia'
    assert_equal ip_meta.city, 'St Petersburg'
    assert_equal ip_meta.lat, 59.8983
    assert_equal ip_meta.lon, 30.2618
  end
end
