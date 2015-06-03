class SubTask < ActiveRecord::Base
  has_many :pre_tasks
  belongs_to :task

  accepts_nested_attributes_for :pre_tasks, :reject_if => :all_blank, :allow_destroy => true
end
