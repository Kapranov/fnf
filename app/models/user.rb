require 'carrierwave/orm/activerecord'

class User < ActiveRecord::Base
  has_many :products, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
  enum role: [:admin, :accounter, :moderator, :agent, :distributor, :manufactured, :simple_buyer]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :simple_buyer
  end

  NON_ADMIN = %w[accounter moderator agent distributor manufactured simple_buyer]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  # validates_presence_of   :avatar
  # validates_integrity_of  :avatar
  # validates_processing_of :avatar
  validates :name, length: { maximum: 25 }, presence: true
  validates :role, length: { maximum: 12 }, presence: true
end
