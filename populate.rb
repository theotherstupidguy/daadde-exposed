require 'nokogiri'
require 'open-uri'
require './models'

if Programme.last
 start =  Programme.last.daad_id
else 
  start = 0
end

#TODO Change me to chooe how many records you need from the website
# ex. 1000 
((start)..(start + 1000)).each do |i|
  prog = Programme.new

  url = "https://www.daad.de/deutschland/studienangebote/international-programs/en/?p=d&s=sk&id=#{i}" 
  data = Nokogiri::HTML(open(url))

  if !Programme.where(daad_id: "#{i}").exists?  
    if !(data.css("img").select{|img| img['title'] == "title #1"}).empty? # .nil?   
      prog.daad_id = "#{i}"
      prog.uni_reg =  data.at_css("#registration").text
      prog.overview =  data.css("td")[9]
      prog.prog_title =  data.at_css(".line").text
      prog.uni_logo = "https://www.daad.de" + (data.css("img").select{|img| img['title'] == "title #1"})[0]['src'] 
      prog.uni_poster = "https://www.daad.de" + (data.css("img").select{|img| img['height']})[1]['src'] 
      prog.save!
    else 
      p "This Programme with ID#{i} was Deleted from daade.de!"
    end
  else 
    p "This Programme with ID#{i} Already exists in our database!"
  end
end
