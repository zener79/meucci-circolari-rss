#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Circolari Meucci"
    xml.author "Claudio Benvenuti"
    xml.description "Elenco delle circolari dell'ITIS A.Meucci di Firenze"
    xml.link "https://www.itismeucci.gov.it"
    xml.language "it"

    for post in @posts
      xml.item do
        if post.title
          xml.title post.title
        else
          xml.title ""
        end
        xml.pubDate post.doc_date.to_s(:rfc822)
        xml.link "https://web.spaggiari.eu/sdg/app/default/view_documento.php?a=akVIEW_FROM_ID&id_documento=#{post.doc_id}&sede_codice=FIIT0009"
        xml.guid post.id
      end
    end
  end
end
