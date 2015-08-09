class Episode < ActiveRecord::Base
  belongs_to :show

  has_many :episode_staffers, dependent: :destroy

  validates :show_id, :number, presence: true

  # Patch for RailsAdmin (RoxasShadow/rails_admin-auto-enum seems not working anymore...)
  Nonchosbatta::Episode::TASKS.each do |task|
    define_method("#{task}=") do |status|
      statuses = Nonchosbatta::Episode::STATUSES
      write_attribute(task, statuses.index(status))
    end

    define_method("#{task}") do
      Nonchosbatta::Episode::STATUSES[read_attribute(task).to_i]
    end

    define_method("#{task}_enum") do
      Nonchosbatta::Episode::STATUSES.map { |status| [status.humanize, status] }
    end
  end

  def title
    "#{show.short_title}\##{number}"
  end
end
