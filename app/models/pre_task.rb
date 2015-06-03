class PreTask < ActiveRecord::Base
  has_many :properties
  belongs_to :task

  accepts_nested_attributes_for :properties, :reject_if => :all_blank, :allow_destroy => true
end
