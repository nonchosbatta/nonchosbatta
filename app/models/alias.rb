class Alias < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'

  validates :owner_id, presence: true
  validates :name,     presence: true, uniqueness: true, length: { minimum: 3 }
end
