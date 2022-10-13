require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))   
def crypto_name(link)
crypto = []
link.xpath("//*/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[*]/td[2]").each do |i| 
crypto.push(i.text)
end 
return crypto
end 

def crypot_price(link)
price = []
link.xpath("//*/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[*]/td[5]").each do |u|
price.push(u.text)
end 
return price
end 

def crypto(link)
crypto_nom = crypto_name(link)
crypto_value = crypot_price(link)
final_crypto  = crypto_nom.zip(crypto_value).to_h
end 
puts crypto(page)








