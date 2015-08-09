class Collaboration < ActiveRecord::Base
  has_many :fansub_collaborations, dependent: :destroy
  has_many :fansubs, through: :fansub_collaborations

  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
end
