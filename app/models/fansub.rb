class Fansub < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'

  has_many :fansub_staffers, dependent: :destroy
  has_many :shows, dependent: :destroy

  validates :owner_id, presence: true
  validates :name,     presence: true, uniqueness: true, length: { minimum: 3 }
  validates :url,      url: { allow_blank: true }
end
