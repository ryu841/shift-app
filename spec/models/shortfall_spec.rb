require 'rails_helper'

RSpec.describe Shortfall, type: :model do
  let(:shift) { create(:shift) }
  let(:start_time) { '2024-11-11 09:00:00' }
  let(:end_time) {'2024-11-11 15:00:00' }
  let(:require_count) { 2 }
  let(:shortfall) { Shortfall.new(start_time: start_time, end_time: end_time, require_count: require_count, shift: shift) }

  describe 'バリデーションの検証' do
    context '正常系' do
      it '有効である' do
        expect(shortfall.valid?).to be(true)
      end
    end

    context '異常系' do
      context 'start_timeが空の場合' do
        let(:start_time) { nil }

        it '無効である' do
          expect(shortfall.valid?).to be(false)
          expect(shortfall.errors[:start_time]).to include('が入力されていません。')
        end
      end

      context 'end_timeが空の場合' do
        let(:end_time) { nil }

        it '無効である' do
          expect(shortfall.valid?).to be(false)
          expect(shortfall.errors[:end_time]).to include('が入力されていません。')
        end
      end

      context 'require_countが空の場合' do
        let(:require_count) { nil }

        it '無効である' do
          expect(shortfall.valid?).to be(false)
          expect(shortfall.errors[:require_count]).to include('が入力されていません。')
        end
      end
    end
  end

  describe 'Shortfallが持つ情報の検証' do
    it 'Shortfallの属性値を返す' do
      expect(shortfall.start_time).to eq('2024-11-11 09:00:00')
      expect(shortfall.end_time).to eq('2024-11-11 15:00:00')
      expect(shortfall.require_count).to eq(2)
    end
  end
end 
