# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Person.destroy_all

%w(abe zelda bob carol nancy dan emma frank gail harry).each do |name|
  instance_variable_set "@#{name}", Person.create(name: name)
end

@abe.children << @bob
@abe.children << @carol
@abe.children << @nancy

@zelda.children << @bob
@zelda.children << @carol

@bob.children << @dan
@bob.children << @emma

@carol.children << @frank
@carol.children << @gail

@nancy.children << @harry
