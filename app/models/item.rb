class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :defrayment
  belongs_to :prefecture
  belongs_to :ship_date
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :content, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :defrayment_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_date_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 },
                    format: { with: /\A[0-9]+\z/ }
  validates :image, presence: true
end
