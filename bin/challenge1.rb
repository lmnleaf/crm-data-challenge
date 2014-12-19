require_relative '../data/crm'
require 'pp'


def company_employees(number)

final_array = []

a = 0

  CRM[:companies].each do |company|

    a += 1
    if a > number
      break
    end

    array = []
    company_hash = {}
    company_hash[:name] = company[:name]

    CRM[:people].each do |person|

      person[:employments].each do |employment|

        if employment[:company_id] == company[:id]
          person_hash = {}
          person_hash[:id] = person[:id]
          person_hash[:first_name] = person[:first_name]
          person_hash[:last_name] = person[:last_name]
          person_hash[:title] = employment[:title]
          array << person_hash
        end

      end

    end

    company_hash[:employees] = array
    final_array << company_hash

  end

  pp final_array

end

company_employees(10)


# ------------------------------- test ------------------

require 'rspec/autorun'

RSpec.describe '#company_employees' do
  it 'returns employees for each company' do

    expected_result = [
  {:name=>"Nicolas and Sons", :employees=>[]},
  {:name=>"Mueller LLC",
    :employees=>
    [{:id=>6,
      :first_name=>"Elise",
      :last_name=>"Camylle",
      :title=>"Regional Applications Designer"},
      {:id=>11,
      :first_name=>"Myra",
      :last_name=>"Sylvester",
      :title=>"Direct Directives Officer"},
      {:id=>13,
      :first_name=>"Unique",
      :last_name=>"Adelbert",
      :title=>"Legacy Interactions Engineer"},
      {:id=>18,
      :first_name=>"Brent",
      :last_name=>"Shannon",
      :title=>"District Factors Designer"},
      {:id=>22,
      :first_name=>"Darby",
      :last_name=>"Della",
      :title=>"Principal Branding Strategist"},
      {:id=>23,
      :first_name=>"Colleen",
      :last_name=>"Doyle",
      :title=>"Senior Division Representative"}]}
      ]

      expect(company_employees(2)).to eq(expected_result)

    end

end
