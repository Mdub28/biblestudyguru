# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if AnnotationType.count == 0
  AnnotationType::TYPES.each do | type |
    AnnotationType.create(description: type)
  end
end

if Denomination.count ==0
  Denomination::TYPES.each do | type |
    Denomination.create(description: type)
  end
end
