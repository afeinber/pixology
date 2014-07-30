alex = User.create(username:'Alex', email: 'alex@example.com', password: 'password', blurb: "Hi! I'm Alex")
kaga = User.create(username: 'Kaga', email: 'kaga@example.com', password: 'password',blurb: "Hi! I'm Kaga")
katryn = User.create(username: 'Katryn', email: 'katryn@example.com', password: 'password',blurb: "Hi! I'm Katryn")


Image.create(
  user_id: 1,
  sharedimg: File.new("#{Rails.root}/app/assets/images/blackcats-lg.jpg")
)

Image.create(
  user_id: 1,
  sharedimg: File.new("#{Rails.root}/app/assets/images/book-lg.jpg")
)

Image.create(
  user_id: 1,
  sharedimg: File.new("#{Rails.root}/app/assets/images/books-lg.jpg")
)

Image.create(
  user_id: 1,
  sharedimg: File.new("#{Rails.root}/app/assets/images/dog-lg.jpg")
)

#Alex following Katryn and Kaga
Follow.create(
  user_id: 1,
  followee_id: 2
)

Follow.create(
  user_id: 1,
  followee_id: 3
)

#Alex followed by Kaga

Follow.create(
  user_id: 2,
  followee_id: 1
)

#Category
Category.create(
  description: 'dog'
  )

Category.create(
  description: 'cat'
  )

Interest.create(
  user_id: 1,
  category_id: 1
  )
Interest.create(
  user_id: 1,
  category_id: 2
  )

#favorite
Favorite.create(
user_id: 1,
image_id: 1
  )
