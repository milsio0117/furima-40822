class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :postage_payer
    belongs_to :prefecture
    belongs_to :shipping_day
    has_one_attached :image
    belongs_to :user
    
    validates :image,               presence: true
    validates :title,               presence: true
    validates :description,         presence: true
    validates :price,               presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :category_id,         numericality: { other_than: 1 , message: "can't be blank"}
    validates :status_id,           numericality: { other_than: 1 , message: "can't be blank"}
    validates :postage_payer_id,    numericality: { other_than: 1 , message: "can't be blank"}
    validates :prefecture_id,       numericality: { other_than: 1 , message: "can't be blank"}
    validates :shipping_day_id,     numericality: { other_than: 1 , message: "can't be blank"}
end
