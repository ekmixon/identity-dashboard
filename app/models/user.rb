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

  def domain
    email.to_s.split('@')[1].to_s
  end

  private

  def member_service_providers
    ServiceProvider.where(user_id: id)
  end
end
