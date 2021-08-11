class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :prefecture, :shipping, :ship_day

  with_options presence: true do
    validates :name
    validates :description
    validates :image
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :condition_id
      validates :shipping_id
      validates :prefecture_id
      validates :ship_day_id
    end
    with_options numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999} do
      validates :price
    end
  end
end
