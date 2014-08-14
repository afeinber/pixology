class Search
  attr_accessor :query, :search_type

  include ActiveModel::Conversion
  extend ActiveModel::Naming

  def initialize(search_params)
    self.query, self.search_type = search_params[:query], search_params[:search_type]
  end


  def search_database
    if search_type == 'Users'
      User.where('username ILIKE ?', "%#{query}%")
    else
      cats = Category.where('description ILIKE ?', "%#{query}").ids
      Image.joins(:categorized_images).where(categorized_images: { category_id: cats }).order(created_at: :desc)
    end
  end
end
