require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    driven_by(:rack_test)
    @admin = create(:admin)
    @shift = create(:shift, title_date: Time.zone.today, comment: 'コメント', admin_id: @admin.id)
    @shift.shortfalls.create(start_time: '09:00', end_time: '15:00', require_count: 2)
  end

  # 投稿フォーム
  let(:title_date) { Time.zone.today }
  let(:start_time) { '09:00' }
  let(:end_time) { '15:00' }
  let(:require_count) { 2 }
  let(:comment) { 'コメント' }

  describe 'シフト作成機能の検証' do
    # シフト投稿を行う一連の動作をまとめる
    subject do
      fill_in 'shift_title_date', with: title_date
      fill_in 'shift_shortfalls_attributes_0_start_time', with: start_time
      fill_in 'shift_shortfalls_attributes_0_end_time', with: end_time
      fill_in 'shift_shortfalls_attributes_0_require_count', with: require_count
      fill_in 'shift-comment-field', with: comment
      click_button '作成'
    end

    context 'ログインしていない場合' do
      before { visit '/shifts/new' }

      it 'ログインページへリダイレクトする' do
        expect(current_path).to eq('/admin/sign_in')
        expect(page).to have_content('ログインが必要です。')
      end
    end

    context 'ログインしている場合' do
      before do
        sign_in @admin
        visit '/shifts/new'
      end

      it 'ログインページへリダイレクトしない' do
        expect(page).not_to eq('/admin/sign_in')
      end

      context 'パラメータが正常な場合' do
        it 'Shiftを作成できる' do
          expect { subject }.to change(Shift, :count).by(1)
          expect(current_path).to eq('/shifts')
          expect(page).to have_content('シフトが作成されました。')
        end
      end

      context 'パラメータが異常な場合' do
        let(:title_date) { nil }

        it 'Shiftを作成できない' do
          expect { subject }.not_to change(Shift, :count)
          expect(page).to have_content('シフトの作成に失敗しました。')
        end

        it '入力していた内容は維持される' do
          subject
          expect(page).to have_field('shift-comment-field', with: comment)
        end
      end

      context '募集日付が過去の日付の場合' do
        let(:title_date) { Time.zone.today - 1.day }

        it 'Shiftを作成できない' do
          expect { subject }.not_to change(Shift, :count)
          expect(page).to have_content('シフトの作成に失敗しました。')
          expect(page).to have_content('シフトの日付 は今日以降の日付を選択してください。')
        end
      end

      describe 'シフト詳細ページの検証' do
        before do
          subject
          visit "/shifts/#{@shift.id}"
        end

        it 'Shiftの詳細が表示される' do
          expect(page).to have_content(Time.zone.today)
          expect(page).to have_content('コメント')
          expect(page).to have_content('店長')
        end
      end
    end
  end

  describe '募集シフト一覧機能の検証' do
    before do
      sign_in @admin
      visit '/shifts'
    end

    it '1件目のShiftの詳細が表示される' do
      expect(page).to have_content(Time.zone.today)
      expect(page).to have_content('コメント')
      expect(page).to have_content('店長')
    end

    it '投稿タイトルをクリックすると詳細ページへ遷移する' do
      click_link Time.zone.today
      expect(current_path).to eq("/shifts/#{@shift.id}")
    end
  end

  describe 'シフト削除機能の検証' do
    context '投稿した管理者でログインしている場合' do
      before do
        sign_in @admin
        visit "/shifts/#{@shift.id}"
      end

      it '削除ボタンを表示する' do
        expect(page).to have_button('削除')
      end

      it '削除ボタンをクリックすると削除できる' do
        expect do
          click_button '削除'
          find('button', text: '送信', match: :first).click
        end.to change(Shift, :count).by(-1)

        expect(current_path).to eq('/shifts')
        expect(page).to have_content('シフトが削除されました。')
        expect(page).not_to have_link("/shifts/#{@shift.id}")
      end
    end

    context '投稿したユーザーでログインしていない場合' do
      it '削除ボタンを表示しない' do
        visit "/shifts/#{@shift.id}"
        expect(page).not_to have_button('削除')
      end

      it '直接リクエストを投げても削除されない' do
        visit "/shifts/#{@shift.id}"

        expect do
          delete shift_path(@shift)
        end.not_to change(Shift, :count)
      end
    end
  end
end
