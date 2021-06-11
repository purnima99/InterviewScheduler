# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 
Interviewer.create([
    {name: "Rose Jain", email_id: "rosejain123@gmail.com ", phone:"9845684768"},
    {name: "Aayushi Gupta", email_id: "aayushi.gupta@gmail.com", phone:"7895674432"},
    {name: "Ishangi Jain", email_id: "jainishangi@gmail.com", phone:"9823667840"}
  ])
  
  Interviewee.create([
    {name: "Akshita Thakur", email_id: "akshita0707@gmail.com", phone:" 7785634400"},
    {name: "Purnima Lal", email_id: "purnimalal@gmail.com", phone:"9456023487"},
    {name: "Shimantika Das", email_id: "shimantika08das@gmail.com", phone:"7003758970"}
  ])