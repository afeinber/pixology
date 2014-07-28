alex = User.create(email: 'alex@example.com', password: 'password')

Image.create({
  :user_id => 1,
  :sharedimg => File.new("#{Rails.root}/app/assets/images/blackcats-lg.jpg"),
})
