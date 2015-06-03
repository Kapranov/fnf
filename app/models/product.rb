class Product < ActiveRecord::Base
  has_many :tasks
  has_many :people
  has_many :product_tags
  has_many :tags, :through => :product_tags, :class_name => 'Tag'
  belongs_to :owner, :class_name => 'Person'
  belongs_to :user

  accepts_nested_attributes_for :tasks, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :people, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :owner, :reject_if => :all_blank
  accepts_nested_attributes_for :tags
  accepts_nested_attributes_for :product_tags, :allow_destroy => true

  validates :name, :presence => true
  # validates :name, :uniqueness => { :case_sensitive => false }
  
end
