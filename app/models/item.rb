class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :defrayment
  belongs_to :prefecture
  belongs_to :ship_date

end
