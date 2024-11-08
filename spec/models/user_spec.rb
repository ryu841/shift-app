require 'rails_helper'

RSpec.describe User, type: :model do
  let(:firstname) { 'テスト' }
  let(:lastname) { '太郎' }
  let(:email) { 'test@example.com' }
  let(:user) { create(:user, firstname: firstname, lastname: lastname, email: email) }

  describe '.first' do
    subject { user }

    it '事前に作成した通りのUserを返す' do
      expect(subject.firstname).to eq(firstname)
      expect(subject.lastname).to eq(lastname)
      expect(subject.email).to eq(email)
    end
  end
end
