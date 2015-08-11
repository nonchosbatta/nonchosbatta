class Collaboration < ActiveRecord::Base
  has_many :fansub_collaborations, dependent: :destroy
  has_many :fansubs, through: :fansub_collaborations

  has_many :aliases, foreign_key: 'subject_id', as: :subject, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
end
