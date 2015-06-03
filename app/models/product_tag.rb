class ProductTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :product

  accepts_nested_attributes_for :tag, :reject_if => :all_blank
end
