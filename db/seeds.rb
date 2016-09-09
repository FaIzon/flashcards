# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'nokogiri'
require 'open-uri'

url = 'http://bit.ly/2c5bLpb'
doc = Nokogiri::HTML(open(url))
doc.css('tr.wrow').each do |item|
  Card.create(original_text: item.at_css('div.word').text, translated_text: item.at_css('div.trans').text)
  #Card.create(original_text: 'Pencil', translated_text: 'Карандаш')
end
