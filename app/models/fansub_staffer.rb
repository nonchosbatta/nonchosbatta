class FansubStaffer < ActiveRecord::Base
  belongs_to :staffer, class_name: 'User'
  belongs_to :fansub

  enum role: Nonchosbatta::Fansub::ROLES

  validates :staffer_id, :fansub_id, :role, presence: true

  # Patch for RailsAdmin (RoxasShadow/rails_admin-auto-enum seems not working anymore...)
  def role_enum=(role)
    write_attribute(:role, role)
  end

  def role_enum
    Nonchosbatta::Fansub::ROLES
  end

  def name
    "#{staffer.username} (#{role})"
  end
end
