require_relative '../data/crm'
require 'pp'


unemployed_list = []

CRM[:people].each do |person|

  unemployed = {}

    if person[:employments] == []

      unemployed[:id] = person[:id]
      unemployed[:first_name] = person[:first_name]
      unemployed[:last_name] = person[:last_name]
      unemployed_list << unemployed
      
    end

    end


pp unemployed_list
