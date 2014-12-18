require_relative '../data/crm'
require 'pp'

# def company_employees

final_array = []

  CRM[:companies].each do |company|

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
