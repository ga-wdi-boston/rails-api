# frozen_string_literal: true
# This file should contain all the record creation needed to experiment with
# your app during development.
#
# The data can then be loaded with the rake db:examples (or created alongside
# the db with db:nuke_pave).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# %w(antony jeff matt jason).each do |name|
#   email = "#{name}@#{name}.com"
#   next if User.exists? email: email
#   User.create!(email: email,
#                password: 'abc123',
#                password_confirmation: nil)
# end

%w(alice bob charlie dana).each do |name|
  email = "#{name}@#{name}.com"
  next if User.exists? email: email
  User.create!(email: email,
               password: 'abc123',
               password_confirmation: nil)
end

%w(alice bob).each_with_index do |name, i|
  title = "Dear Diary Number #{i}"
  email = "#{name}@#{name}.com"
  next if Post.exists? title: title
  Post.create!(title: title,
               body: "Another beautiful day!",
               user: User.find_by(email: email))
end

%w(charlie dana).each do |name|
  body = "Great post!"
  email = "#{name}@#{name}.com"
  user = User.find_by(email: email)
  next if Comment.exists? body: body, user: user
  Comment.create!(body: body,
                  post: Post.all.sample,
                  user: user)
end
