inc5000 list Scraper
======

This gem is designed to scrape the Inc5000 list and output the results into a CSV for easier parsing.

Installation
------------
Add `inc_5000_list_scraper` to you Gemfile.

``` ruby
gem 'inc_5000_list_scraper'
```

Usage
-----
Call `create_csv!` to generate a CSV file 'inc_5000_list.csv'. You can optionally pass a year if one other than 2020 is desired
``` ruby
Inc5000List::Scraper.create_csv!(2019)
```
