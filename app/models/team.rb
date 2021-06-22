class Team < ApplicationRecord
  self.table_name = :groups

  has_paper_trail on: %i[create update destroy]

  belongs_to :agency

  has_many :service_providers, dependent: :nullify, foreign_key: 'group_id',
                               inverse_of: :team
  has_many :user_teams, foreign_key: 'group_id', inverse_of: :team
  has_many :users, dependent: :destroy, through: :user_teams

  validates :name, presence: true, uniqueness: true

  after_update :update_service_providers

  def to_s
    name
  end

  def user_deletion_history
    PaperTrail::Version.
      where(event: 'destroy', item_type: 'UserTeam').
      where("object ->>'group_id' = '?'", id)
  end

  def user_deletion_report_item(deleted_record)
    {
      user_id: deleted_record['user_id'],
      user_email: User.find_by(id: deleted_record['user_id'])&.email,
      team_id: deleted_record['group_id'],
      team_name: Team.find_by(id: deleted_record['group_id'])&.name,
      removed_at: deleted_record['removed_at'],
      whodunnit_id: deleted_record['whodunnit_id'],
      whodunnit_email: User.find_by(id: deleted_record['whodunnit_id'])&.email,
    }
  end

  def user_deletion_history_report(email: nil, limit: 5000)
    user_deletion_history.
      order(created_at: :desc).
      limit(limit).
      pluck(:object, :created_at, :whodunnit).
      select { |object, _, _|
        email.nil? || User.find_by(id: object['user_id'])&.email == email
      }.
      map do |deleted_record, removed_at, whodunnit_id|
        deleted_record['removed_at'] = removed_at
        deleted_record['whodunnit_id'] = whodunnit_id
        user_deletion_report_item(deleted_record)
      end
  end

  def update_service_providers
    service_providers.each do |sp|
      sp.update(agency_id: agency.id) if agency
    end
  end
end
