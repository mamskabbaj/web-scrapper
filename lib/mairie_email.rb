require 'nokogiri'
require 'open-uri'

def get_townhall_email(townhall_url)
page = Nokogiri::HTML(URI.open(townhall_url))
puts page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
end 

def get_townhall_url
    page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
email=[]
for a in 1..184
url = page.xpath("//a[@class='lientxt']/@href")[a].text[1..-1]
email = email<< get_townhall_email("https://www.annuaire-des-mairies.com/#{url}")
end 
return email 
end 

get_townhall_url 



