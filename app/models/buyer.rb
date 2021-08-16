class Buyer < ApplicationRecord
  belongs_to :buy_record
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture


end
