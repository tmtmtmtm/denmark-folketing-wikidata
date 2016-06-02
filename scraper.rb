require 'wikidata/fetcher'

wp = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://da.wikipedia.org/wiki/Folketingsmedlemmer_valgt_i_2015',
  xpath: '//h2/following-sibling::ul//a[contains(@href, "/wiki/") and not(@class="new")]/@title',
) 
scraped = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/denmark-folketing-wp', column: 'wikiname')
category = WikiData::Category.new( "Kategori:Folketingsmedlemmer i 2010'erne", 'da').member_titles 

EveryPolitician::Wikidata.scrape_wikidata(names: { da: wp | scraped | category })
