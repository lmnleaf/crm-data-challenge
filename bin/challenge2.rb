require_relative '../data/crm'
require 'pp'


employments_list = []

a = 0

CRM[:people].each do |person|

    a += 1
    if a > 20
      break
    end

  person[:employments].each do |employment|

    employment_info = {}

      if person[:employments] != []

        CRM[:companies].each do |company|

          if employment[:company_id] == company[:id]
            employment_info[:company_id] = company[:id]
            employment_info[:company_name] = company[:name]
          end

        end

        employment_info[:person_id] = person[:id]
        employment_info[:person_first_name] = person[:first_name]
        employment_info[:person_last_name] = person[:last_name]
        employment_info[:title] = employment[:title]

        employments_list << employment_info

    end

  end

end

pp employments_list
