require 'rails_helper'
describe UserHelper do
  let(:user) { build(:user) }

  describe '#unconfirmed?' do
    it 'returns true if the user is has missed the sign-in deadline' do
      user.created_at = 15.days.ago
      expect(unconfirmed?(user)).to be true
    end

    it 'returns false if the user is has not missed the sign-in deadline' do
      user.created_at = 2.days.ago
      expect(unconfirmed?(user)).to be false
    end
  end

  describe '#deadline' do
    it 'returns date in MM/DD/YYYY format' do
      created_at = Time.zone.now
      deadline = (created_at + 14.days).strftime('%m/%d/%Y')
      user.created_at = created_at
      expect(deadline(user)).to eq(deadline)
    end
  end

  describe('#can_delete_unconfirmed_users?') do
    it 'returns true if any users are unconfirmed and the current user is an admin' do
      current_user = build(:user)
      current_user.admin = true
      user.created_at = 15.days.ago
      users = [user]
      expect(can_delete_unconfirmed_users?(current_user, users)).to be true
    end

    it 'returns false if the current user is not an admin' do
      current_user = build(:user)
      user.created_at = 2.days.ago
      users = [user]
      expect(can_delete_unconfirmed_users?(current_user, users)).to be false
    end

    it 'returns false if no users are unconfirmed' do
      current_user = build(:user)
      user.created_at = 2.days.ago
      users = [user]
      expect(can_delete_unconfirmed_users?(current_user, users)).to be false
    end
  end

  describe '#sign_in_icon' do
    it 'returns success image for user that has signed in' do
      user.uuid = '3298uekefjlsejoeioeiur'
      expect(sign_in_icon(user)).to eq('img/alerts/success.svg')
    end

    it 'returns warning image for user that is unconfirmed' do
      user.created_at = 20.days.ago
      expect(sign_in_icon(user)).to eq('img/alerts/warning.svg')
    end

    it 'returns error image for user that has not yet signed in' do
      user.created_at = 2.days.ago
      expect(sign_in_icon(user)).to eq('img/alerts/error.svg')
    end
  end

  describe '#title' do
    it 'returns title attribute for user that has signed in' do
      user.uuid = '3298uekefjlsejoeioeiur'
      expect(title(user)).to eq('User has signed in')
    end

    it 'returns title attribute for unconfirmed user' do
      user.created_at = 20.days.ago
      expect(title(user)).to include('Unconfirmed user (sign-in deadline:')
    end

    it 'returns title attribute for user yet to sign in' do
      user.created_at = 2.days.ago
      expect(title(user)).to eq('User has not yet signed in')
    end
  end

  describe '#alt' do
    it 'returns alt attribute for user that has signed in' do
      user.uuid = '3298uekefjlsejoeioeiur'
      expect(alt(user)).to eq('Icon indicating user has signed in')
    end

    it 'returns alt attribute for unconfirmed user' do
      user.created_at = 20.days.ago
      expect(alt(user)).to include('Icon indicating unconfirmed user (sign-in deadline:')
    end

    it 'returns alt attribute for user yet to sign in' do
      user.created_at = 2.days.ago
      expect(alt(user)).to eq('Icon indicating user has not yet signed in')
    end
  end
end
