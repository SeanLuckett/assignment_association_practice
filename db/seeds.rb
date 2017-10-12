# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
10.times do |i|
  User.create name: "foouser#{i}"
end

@users = User.all

# Categories
9.times do |i|
  Category.create name: "Category #{i}"
end

@categories = Category.all

# Posts
@users.each do |u|
  5.times do |i|
    Post.create title: "foouser#{u.id} post #{i}",
                body:  "Some words for foouser#{u.id}'s post number #{i}.",
                category_id: @categories.sample.id
  end
end

@posts = Post.all

# Comments

25.times do |i|
  user = @users.sample
  post = @posts.sample

  Comment.create(
    body: "A comment from foouser#{user.id} on post: #{post.title}.",
    user_id: user.id,
    post_id: post.id
  )
end

18.times do |i|
  Tag.create name: "Tag #{i}"
end