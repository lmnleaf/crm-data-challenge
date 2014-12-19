require_relative '../data/crm'
require 'pp'


def employments(number)

  employments_list = []

    a = 0

  CRM[:people].each do |person|

      a += 1
      if a > number
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

end

employments(4)


# -------------------------------- test -------------------------


require 'rspec/autorun'

RSpec.describe '#employments' do
  it 'returns employments' do

    expected_result = [
        {:company_id=>4,
        :company_name=>"Schmidt-Rolfson",
        :person_id=>3,
        :person_first_name=>"Elyse",
        :person_last_name=>"Jensen",
        :title=>"Chief Communications Consultant"},
        {:company_id=>7,
        :company_name=>"Nikolaus Inc",
        :person_id=>4,
        :person_first_name=>"Frieda",
        :person_last_name=>"Tess",
        :title=>"Dynamic Data Specialist"}
        ]

        expect(employments(4)).to eq(expected_result)

    end

end
