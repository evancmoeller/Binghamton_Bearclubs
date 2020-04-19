# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# CREATE TABLE IF NOT EXISTS "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "email" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
# INSERT INTO users VALUES(1,'Kevin Henneberger','khenneb1@binghamton.edu','2020-04-14 20:15:53.275330','2020-04-14 20:15:53.275330');

# CREATE TABLE IF NOT EXISTS "authorizations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "provider" varchar, "uid" varchar, "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
# INSERT INTO authorizations VALUES(1,'github','54592837',1,'2020-04-14 20:15:53.321437','2020-04-14 20:15:53.321437');

=begin
users = [
  {:name => 'Baxter Bearcat', :email => 'bbearcat1@binghamton.edu'}
]
users.each do |user|
  User.create!(user)
end

authorizations = [
  {:provider => 'github', :uid => '12345678', :user_id => 1}
]
authorizations.each do |authorization|
  Authorization.create!(authorization)
end
=end
