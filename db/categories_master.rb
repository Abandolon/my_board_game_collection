require 'json'
require 'open-uri'

url = 'https://www.boardgameatlas.com/api/game/categories?pretty=true&client_id=p4PR6A8SOV'
url_result = open(url).read
@categories_master = JSON.parse(url_result)
