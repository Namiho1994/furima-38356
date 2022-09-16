class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  #belongs_to :user
  #has_one :order
  has_one_attached :image

  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :item_scheduled_delivery

  validates :name, presence: true
  validates :info, presence: true
  validates :category_id, presence: true
  validates :sales_status_id, presence: true
  validates :shipping_fee_status_id, presence: true
  validates :prefecture_id, presence: true
  validates :item_scheduled_delivery_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_orequal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :user_id, presence: true
  validates :image, presence: true


  validates :category_id, numericality: { other_than: 0 } 
  validates :sales_status_id, numericality: { other_than: 0 } 
  validates :shipping_fee_status_id, numericality: { other_than: 0 } 
  validates :prefecture_id, numericality: { other_than: 0 } 
  validates :item_scheduled_delivery_id, numericality: { other_than: 0 } 
  
end
