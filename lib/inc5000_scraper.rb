class Inc5000Scraper
  INC_LIST_REST_URI = 'https://www.inc.com/rest/i5list/2020'.freeze

  def self.scrape!
    new.scrape!
  end

  def scrape!
    CSV.open('inc_5000_list.csv', 'wb') do |out|
      out << company_row(companies.first).keys

      companies.each do |company|
        out << company_row(company).values
      end
    end
  end

  def list_as_text
    OpenURI.open_uri(INC_LIST_REST_URI).read
  end

  def list_as_json
    @list_as_json ||= JSON.parse(list_as_text)
  end

  def companies
    @companies ||= list_as_json['companies'].map { |c| OpenStruct.new(c) }
  end

  def company_row(company)
    {
      rank: company.rank,
      company_name: company.company,
      city: company.city,
      state: company.state_s,
      website: company.website
    }
  end
end
