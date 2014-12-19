require_relative '../data/crm'
require 'pp'

def unemployed_people(number)

  a = 0

  unemployed_list = []

  CRM[:people].each do |person|

    a += 1
    if a > number
      break
    end

    unemployed = {}

      if person[:employments] == []

        unemployed[:id] = person[:id]
        unemployed[:first_name] = person[:first_name]
        unemployed[:last_name] = person[:last_name]
        unemployed_list << unemployed

      end

  end

  pp unemployed_list

end

unemployed_people(8)

# ---------------------- test ----------------------------

require 'rspec/autorun'

RSpec.describe '#unemployed_people' do
  it 'returns a list of unemployed people' do

    expected_result = [
        {:id=>1, :first_name=>"Whitney", :last_name=>"Domenic"},
        {:id=>2, :first_name=>"Savannah", :last_name=>"Clementina"},
        {:id=>5, :first_name=>"Albin", :last_name=>"Leo"},
        {:id=>8, :first_name=>"Francis", :last_name=>"Arlo"}]

        expect(unemployed_people(8)).to eq(expected_result)

    end

end
