class Show < ActiveRecord::Base
  belongs_to :fansub
  belongs_to :collaboration

  has_many :episodes, dependent: :destroy

  enum status: Nonchosbatta::Show::STATUSES
  enum format: Nonchosbatta::Show::FORMATS

  validates :title, presence: true, length: { minimum: 3 }
  validates :ended_at, date: { after_or_equal_to: :started_at, allow_blank: true }, if: 'ended_at.present?'

  validate :fansub_xor_collaboration

  # Patch for RailsAdmin (RoxasShadow/rails_admin-auto-enum seems not working anymore...)
  def status_enum=(status)
    write_attribute(:status, status)
  end

  def status_enum
    Nonchosbatta::Show::STATUSES.map { |status| [status.humanize, status] }
  end

  def format_enum=(format)
    write_attribute(:format, format)
  end

  def format_enum
    Nonchosbatta::Show::FORMATS.map { |format| [format.humanize, format] }
  end

  private
  def fansub_xor_collaboration
    unless fansub.blank? ^ collaboration.blank?
      errors.add(:base, 'Fansub or Collaboration is required')
    end
  end
end
