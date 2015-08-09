class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable

  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }

  has_many :aliases, foreign_key: 'owner_id', dependent: :destroy
  has_many :fansubs, dependent: :destroy

  # Patch for RailsAdmin
  def name
    username
  end
end
