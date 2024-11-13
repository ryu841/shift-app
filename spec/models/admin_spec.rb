require 'rails_helper'

RSpec.describe Admin, type: :model do
  let(:email) { 'test@example.com' }
  let(:admin) { build(:admin, email: email) }

  describe '.first' do
    subject { admin }

    it '事前に作成した通りのAdminを返す' do
      expect(subject.email).to eq(email)
    end
  end
end
