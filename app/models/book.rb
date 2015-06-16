class Book < ActiveRecord::Base
  belongs_to :product
  belongs_to :user #dinners側の

  scope :list_of_books, -> (user){joins(product: :user).where(books: {product_id: user.products.ids}).order(date: :asc)}
  scope :list_of_self_books, -> (user){where(user_id: user.id)}
end
