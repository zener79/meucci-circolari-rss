require 'open-uri'

task :scraper => :environment  do

  begin
    url = "https://web.spaggiari.eu/sdg/app/default/comunicati.php?sede_codice=FIIT0009"
    mypage=""
    open(url) do |http|
      mypage = http.read
    end
    pagedoc = Nokogiri::HTML(mypage)
    (2..12).each do |r|
      title=pagedoc.at_xpath( "//*[@id='table-documenti']/tr[#{r}]/td[2]/span[1]").text
      if Post.find_by_title(title).nil?
        doc_id= pagedoc.at_xpath( "//*[@id='table-documenti']/tr[#{r}]/td[3]/div")[:id_doc]
        doc_date= pagedoc.at_xpath( "//*[@id='table-documenti']/tr[#{r}]/td[2]/span[3]").text
        p = Post.create(title: title, doc_id: doc_id, doc_date: doc_date.to_date )
      end
    end
  rescue  Exception => e
    puts e
  end

end


