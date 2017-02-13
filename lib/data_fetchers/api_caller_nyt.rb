require 'pry'

class NYTApi

  attr_reader :url, :nyt_data, :month_year, :make_albums

  def initialize(month_year)
    @url = "https://api.nytimes.com/svc/seach/v2/articlesearch.json"
    @month_year = month_year
    uri = URI("https://api.nytimes.com/svc/search/v2/articlesearch.json")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  uri.query = URI.encode_www_form({
    "api-key" => "0668f4553bce4d36ab33db11dfef2d3d",
    "begin_date" => "#{month_year}",
    "end_date" => "#{month_year}",
    "page" => 0,
    "section_name" => "World"
  })
  request = Net::HTTP::Get.new(uri.request_uri)
  @result = JSON.parse(http.request(request).body)
  @result.inspect

  end


  def make_albums
    all_albums = @result["response"]["docs"]
    results = all_albums[0]["headline"]["main"]
    results
  end

end
