class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable

  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }

  # Patch for RailsAdmin
  def name
    username
  end
end
