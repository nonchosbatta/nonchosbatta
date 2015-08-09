class FansubCollaboration < ActiveRecord::Base
  belongs_to :fansub
  belongs_to :collaboration

  validates :fansub_id, :collaboration_id, presence: true
end
