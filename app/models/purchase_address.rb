class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :block, :building, :tel, :token

  validates :city, :block, :user_id, :item_id, presence: true
  validates :post_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "はハイフンを入れて半角で入力してください"}
  validates :tel, presence: true, format: { with: /\A\d{10,11}\z/, message: "は10桁〜11桁の半角文字で入力してください"}
  validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :token, presence: { message: "を正しく入力してください"}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, block: block, building: building, tel: tel,
                   purchase_id: purchase.id)
  end
end
