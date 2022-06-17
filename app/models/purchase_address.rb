class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :block, :building, :tel

  validates :city, :block, :user_id, :item_id, presence: true
  validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :tel, presence: true, format: {with: /\A\d{10,11}\z/}
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, block: block, building: building, tel: tel, purchase_id: purchase.id)
  end
end 