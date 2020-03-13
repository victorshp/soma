# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Answer.destroy_all
Question.destroy_all
Survey.destroy_all
SurveyAnswer.destroy_all

User.create(email: 'warren@socratesinc.com', password: 'password')
User.create(email: 'gramsay@gmail.com', password: 'password')
User.create(email: 'jchild@gmail.com', password: 'password')
