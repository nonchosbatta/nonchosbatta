##
# User          has 0-n aliases (used in EpisodeStaffer)
# Fansub        has 0-n aliases (used in Show)
# Collaboration has 0-n aliases (used in Show)
##
class Alias < ActiveRecord::Base
  belongs_to :subject, polymorphic: true

  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
end
