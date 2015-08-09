class EpisodeStaffer < ActiveRecord::Base
  belongs_to :staffer, class_name: 'User'
  belongs_to :alias
  belongs_to :episode

  enum role: Nonchosbatta::Fansub::ROLES

  validates :staffer_id, :episode_id, :role, presence: true

  # Patch for RailsAdmin (RoxasShadow/rails_admin-auto-enum seems not working anymore...)
  def role_enum=(role)
    write_attribute(:role, role)
  end

  def role_enum
    Nonchosbatta::Fansub::ROLES.map { |role| [role.humanize, role] }
  end

  def name
    "#{staffer.username} - #{role.humanize} (#{episode.show.short_title}\##{episode.number})"
  end
end
