require "net/http"
require "uri"
require "json"

class KakaoAddressService
  BASE_URL = "https://dapi.kakao.com/v2/local/search/address.json".freeze

  def self.search(query)
    uri = URI(BASE_URL)
    uri.query = URI.encode_www_form(query: query)

    request = Net::HTTP::Get.new(uri)
    request["Authorization"] = "KakaoAK #{ENV.fetch('KAKAO_REST_API_KEY')}"

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end

    raise "Kakao API Error: #{response.code}" unless response.is_a?(Net::HTTPSuccess)

    JSON.parse(response.body)
  end
end