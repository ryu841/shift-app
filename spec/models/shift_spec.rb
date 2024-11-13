require 'rails_helper'

RSpec.describe Shift, type: :model do
  before { @admin = create(:admin) }

  let(:title_date) { Time.zone.today }
  let(:comment) { 'コメント' }
  let(:admin_id) { @admin.id }
  let(:shift) { Shift.new(title_date: title_date, comment: comment, admin_id: admin_id) }

  describe 'バリデーションの検証' do
    context '正常系' do
      it '有効である' do
        expect(shift.valid?).to be(true)
      end
    end

    context '異常系' do
      context 'title_dateが空の場合' do
        let(:title_date) { nil }

        it '無効である' do
          expect(shift.valid?).to be(false)
          expect(shift.errors[:title_date]).to include('が入力されていません。')
        end
      end

      context 'admin_idが空の場合' do
        let(:admin_id) { nil }
        it '無効である' do
          expect(shift.valid?).to be(false)
          expect(shift.errors[:admin]).to include('が入力されていません。')
        end
      end
    end
  end

  describe 'Shiftが持つ情報の検証' do
    it 'Shiftの属性値を返す' do
      expect(shift.title_date).to eq(Time.zone.today)
      expect(shift.comment).to eq('コメント')
      expect(shift.admin_id).to eq(@admin.id)
    end
  end
end
