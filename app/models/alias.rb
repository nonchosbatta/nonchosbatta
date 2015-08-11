class Alias < ActiveRecord::Base
  belongs_to :subject, polymorphic: true

  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
end
