class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:regular, :admin]

  after_initialize :set_default_role, :if => :new_record?

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def set_default_role
    self.role ||= :regular
  end
end
