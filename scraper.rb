require 'wikidata/fetcher'

wp2015 = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://da.wikipedia.org/wiki/Folketingsmedlemmer_valgt_i_2015',
  xpath: '//h2/following-sibling::ul//a[contains(@href, "/wiki/") and not(@class="new")]/@title',
  as_ids: true,
)

sparq = 'SELECT ?item WHERE { ?item wdt:P39 wd:Q12311817 }'
p39s  = EveryPolitician::Wikidata.sparql(sparq)

EveryPolitician::Wikidata.scrape_wikidata(ids: p39s | wp2015)
