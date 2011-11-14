# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

CSV.open('db/csv/dvdlist.csv', 'r').each do |row|
  if (row[0]) 
    Entry.find_or_create_by_title(row[0].strip)
  end
end