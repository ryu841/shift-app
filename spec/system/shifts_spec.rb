require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    driven_by(:rack_test)
    @user = create(:user)
    @shift = create(:shift, title_date: Time.zone.today, comment: 'コメント')
  end

  # 投稿フォーム
  let(:title_date) { Time.zone.today }
  let(:comment) { 'コメント' }

  describe 'シフト作成機能の検証' do
    # シフト投稿を行う一連の動作をまとめる
    subject do
      fill_in 'shift_title_date', with: title_date
      fill_in 'shift_comment', with: comment
      click_button '作成'
    end

    context 'ログインしていない場合' do
      before { visit '/shifts/new' }

      it 'ログインページへリダイレクトする' do
        expect(current_path).to eq('/users/sign_in')
        expect(page).to have_content('ログインが必要です。')
      end
    end

    context 'ログインしている場合' do
      before do
        sign_in @user
        visit '/shifts/new'
      end

      it 'ログインページへリダイレクトしない' do
        expect(page).not_to eq('/users/sign_in')
      end

      context 'パラメータが正常な場合' do
        it 'Postを作成できる' do
          expect { subject }.to change(Shift, :count).by(1)
          expect(current_path).to eq('/')
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
          expect(page).to have_field('shift_comment', with: comment)
        end
      end

      describe 'シフト詳細ページの検証' do
        before { visit "/shifts/#{@shift.id}" }

        it 'Shiftの詳細が表示される' do
          expect(page).to have_content(Time.zone.today)
          expect(page).to have_content('コメント')
          expect(page).to have_content('店長')
        end
      end
    end
  end
end
