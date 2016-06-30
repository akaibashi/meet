class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_paranoid
  attr_accessible :name, :status, :deleted_at, :email, :password, :password_confirmation, :profile, :location, :sex, :remember_me
  before_create :reset_param

  def reset_param
    self.status = "active"
  end

  has_many :comments

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
end
