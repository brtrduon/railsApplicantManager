class Recycle < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  belongs_to :user
  has_many :scolds, dependent: :destroy
  has_many :users, through: :scolds
  validates :first_name, :last_name, :job_position, :city, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :can_start, presence: true
  validate :crack

  def crack
    if can_start.present? && can_start < Date.today
      errors.add(:can_start, "date can't be in the past")
    end
  end
end
