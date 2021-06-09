class User < ApplicationRecord
  acts_as_paranoid

  has_paper_trail on: %i[create update destroy]

  devise :trackable, :timeoutable
  has_many :user_teams, dependent: :nullify
  has_many :teams, through: :user_teams
  has_many :service_providers, through: :teams
  has_many :security_events, dependent: :destroy

  validates_with UserValidator, on: :create

  scope :sorted, -> { order(email: :asc) }

  def scoped_teams
    if admin?
      Team.all
    else
      teams
    end
  end

  def scoped_service_providers
    (member_service_providers + service_providers).
      uniq.
      sort_by! { |sp| sp.friendly_name.downcase }
  end

  def user_deletion_history
    PaperTrail::Version.
      where(event: 'destroy', item_type: 'UserTeam').
      where("object ->>'user_id' = '?'", id)
  end

  def user_deletion_report_item(record)
    {
      user_id: record[0]['user_id'],
      user_email: User.find_by(id: record[0]['user_id'])&.email,
      team_id: record[0]['group_id'],
      team_name: Team.find_by(id: record[0]['group_id'])&.name,
      removed_at: record[1],
      whodunnit_id: record[2],
      whodunnit_email: User.find_by(id: record[2])&.email,
    }
  end

  def user_deletion_history_report
    user_deletion_history.
      order(created_at: :desc).
      limit(5000).
      pluck(:object, :created_at, :whodunnit).
      map { |record|
        user_deletion_report_item(record)
      }
  end

  def domain
    email.to_s.split('@')[1].to_s
  end

  private

  def member_service_providers
    ServiceProvider.where(user_id: id)
  end
end
