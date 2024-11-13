require 'rails_helper'

RSpec.describe 'Home', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'トップページの検証' do
    it 'Home#topという文字列が表示される' do
      visit '/'

      expect(page).to have_content('Home#top')
    end
  end

  describe 'ナビゲーションバーの検証' do
    context 'ログインしていない場合' do
      before { visit '/' }

      it 'ユーザー登録リンクを表示する' do
        expect(page).to have_link('ユーザー登録', href: '/users/sign_up')
      end

      it '管理者登録リンクを表示する' do
        expect(page).to have_link('管理者登録', href: '/admin/sign_up')
      end

      it 'ログインリンクを表示する' do
        expect(page).to have_link('ログイン', href: '/users/sign_in')
      end

      it 'ログアウトリンクを表示しない' do
        expect(page).not_to have_content('ログアウト')
      end

      it 'シフト作成リンクを表示しない' do
        expect(page).not_to have_link('シフト作成', href: '/shifts/new')
      end
    end

    context 'ログインしている場合' do
      before do
        user = create(:user)
        admin = create(:admin)
        sign_in user
        sign_in admin
        visit '/'
      end

      it 'ユーザー登録リンクは表示しない' do
        expect(page).not_to have_link('ユーザー登録', href: '/users/sign_up')
      end

      it '管理者登録リンクは表示しない' do
        expect(page).not_to have_link('管理者登録', href: '/admin/sign_up')
      end

      it 'ログインリンクは表示しない' do
        expect(page).not_to have_link('ログイン', href: '/users/sign_in')
      end

      it 'ログアウトリンクを表示する' do
        expect(page).to have_content('ログアウト')
      end

      it 'シフト作成リンクを表示する' do
        expect(page).to have_link('シフト作成', href: '/shifts/new')
      end

      it 'ログアウトリンクが機能する' do
        click_button 'ログアウト'

        expect(page).to have_link('ユーザー登録', href: '/users/sign_up')
        expect(page).to have_link('管理者登録', href: '/admin/sign_up')
        expect(page).to have_link('ログイン', href: '/users/sign_in')
        expect(page).not_to have_button('ログアウト')
      end
    end
  end
end
