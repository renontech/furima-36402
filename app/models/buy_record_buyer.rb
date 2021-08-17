class BuyRecordBuyer
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :block
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/}
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    buy_record = BuyRecord.create(user_id: user_id, item_id: item_id)
    Buyer.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, buy_record_id: buy_record.id)
  end
end