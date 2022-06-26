class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :defrayment
  belongs_to :prefecture
  belongs_to :ship_date
  belongs_to :user
  has_many_attached :images
  has_one :purchase

  validates :name, presence: true
  validates :content, presence: true
  validates :category_id, numericality: { other_than: 1, message: 'を入力してください' }
  validates :status_id, numericality: { other_than: 1, message: 'を入力してください' }
  validates :defrayment_id, numericality: { other_than: 1, message: 'を入力してください' }
  validates :prefecture_id, numericality: { other_than: 1, message: 'を入力してください' }
  validates :ship_date_id, numericality: { other_than: 1, message: 'を入力してください' }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 },
                    format: { with: /\A[0-9]+\z/ }
  validates :images, presence: true
  validates :images, length: { minimum: 1, maximum: 5, message: 'は1枚以上3枚以下にしてください' }
end
