require 'uri'
require 'net/http'
require 'json'
 
url = URI("https://api.openuv.io/api/v1/uv?lat=-33.34&lng=115.342&dt=2018-01-24T10%3A50%3A52.283Z")
 
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE
 
request = Net::HTTP::Get.new(url)
request["x-access-token"] = '17f29991f90b98116da1293e1d7ebb76'
 
response = http.request(request)
File.write('./sample-data.json', JSON.dump(response.read_body))