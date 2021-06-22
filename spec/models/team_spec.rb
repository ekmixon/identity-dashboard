require 'rails_helper'

describe Team do
  let(:user) { create(:user) }
  let(:team) { create(:team) }
  let(:user_team) { create(:user_team) }

  describe 'Associations' do
    it { should have_many(:users) }
    it { should have_many(:service_providers) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }

    it 'validates uniqueness of name' do
      name = 'good name'
      create(:team, name: name)
      duplicate = build(:team, name: name)

      expect(duplicate).not_to be_valid
    end
  end

  describe '.sorted' do
    it 'returns users in alpha ordered by email' do
      b_user = create(:user, email: 'b@example.com')
      c_user = create(:user, email: 'c@example.com')
      a_user = create(:user, email: 'a@example.com')

      expect(User.sorted).to eq([a_user, b_user, c_user])
    end
  end

  describe '#user_deletion_history', versioning: true do
    it 'returns user deletion_history from paper_trail' do
      user_team.destroy
      deletion_history = user_team.team.user_deletion_history
      expect(deletion_history.count).to eq(1)
    end
  end

  describe '#user_deletion_report_item' do
    it 'returns formated record from user_deletion_history' do
      history_record = [
        {'id'=>1, 'user_id'=>2, 'group_id'=>3,
         'created_at'=>'2021-06-08T17:34:06Z',
         'updated_at'=>'2021-06-08T17:34:06Z'},
        Time.zone.now, '1'
      ]
      report_item = user.user_deletion_report_item(history_record)
      expect(report_item[:user_id]).to eq(2)
    end
  end

  describe '#user_deletion_history_report', versioning: true do
    it 'returns deletion history when no email is provided' do
      user_id = user_team.user_id
      user_team.destroy
      deletion_report = user_team.team.user_deletion_history_report
      expect(deletion_report.first[:user_id]).to eq(user_id)
    end
    it 'returns deletion history when email is provided' do
      user_id = user_team.user_id
      user_email = user_team.user.email
      user_team.destroy
      report = user_team.team.user_deletion_history_report(user_email)
      expect(report.first[:user_id]).to eq(user_id)
    end
  end

  describe 'paper_trail', versioning: true do
    it { is_expected.to be_versioned }

    it 'tracks creation' do
      expect { create(:team) }.to change { PaperTrail::Version.count }.by(1)
    end

    it 'tracks updates' do
      team = create(:team)

      expect { team.update!(name: 'Team Awesome') }.to change { PaperTrail::Version.count }.by(1)
    end

    it 'tracks deletion' do
      team = create(:team)

      expect { team.destroy }.to change { PaperTrail::Version.count }.by(1)
    end
  end
end
