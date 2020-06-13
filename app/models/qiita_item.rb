require 'json'
class QiitaItem < ApplicationRecord
  def self.get

    url = 'https://qiita.com'
    connection = Faraday.new(url: url) # （1）
    response = connection.get do |req| # （2）
      req.url '/api/v2/items', page: 1, per_page: 100, query: 'tag:Rails updated:>2019-02 stocks:>3' # （3）
    end

    json = JSON.parse(response.body) # （4）
    json.sort_by { |i| i['likes_count']}.reverse.map do |item| # （5）
      { title: item['title'], url: item['url'], likes_count: item['likes_count'] }
    end.take(20)
  end
end
