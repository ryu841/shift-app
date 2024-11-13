require 'rails_helper'

RSpec.describe Admin, type: :model do
  let(:email) { 'test@example.com' }
  let(:password) { '111111' }
  let(:admin) { Admin.new(email: email, password: password, password_confirmation: password) }

  describe '.first' do
    before do
      @admin = create(:admin, email: email, password: password, password_confirmation: password)
      @shift = create(:shift, title_date: Time.zone.today, comment: 'コメント', admin_id: @admin.id)
      @shift.shortfalls.create(start_time: '09:00', end_time: '15:00', require_count: 2)
    end

    subject { described_class.first }

    it '事前に作成した通りのAdminを返す' do
      expect(subject.email).to eq(email)
    end

    it '紐づくShiftの情報を取得できる' do
      expect(subject.shifts.size).to eq(1)
      expect(subject.shifts.first.title_date).to eq(Time.zone.today)
      expect(subject.shifts.first.comment).to eq('コメント')
      expect(subject.shifts.first.admin_id).to eq(@admin.id)
    end
  end
end
