require 'rails_helper'

RSpec.describe 'Home', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'トップページの検証' do
    it 'Shiftappという文字列が表示される' do
      visit '/'

      expect(page).to have_content('Shiftapp')
    end
  end

  describe 'ナビゲーションバーの検証' do
    context 'ログインしていない場合' do
      before { visit '/' }

      it 'ユーザー登録リンクを表示する' do
        expect(page).to have_link('新規登録', href: '/users/sign_up')
      end

      it '管理者登録リンクを表示する' do
        expect(page).to have_link('新規登録', href: '/admin/sign_up')
      end

      it 'ユーザーログインリンクを表示する' do
        expect(page).to have_link('ログイン', href: '/users/sign_in')
      end

      it '管理者ログインリンクを表示する' do
        expect(page).to have_link('ログイン', href: '/admin/sign_in')
      end

      it 'ログアウトリンクを表示しない' do
        expect(page).not_to have_content('ログアウト')
      end

      it 'シフト作成リンクを表示しない' do
        expect(page).not_to have_link('シフト作成', href: '/shifts/new')
      end

      it '募集シフト一覧リンクを表示しない' do
        expect(page).not_to have_link('募集シフト一覧', href: '/shifts')
      end
    end

    context 'ユーザーログインしている場合' do
      before do
        user = create(:user)
        sign_in user
        visit '/'
      end

      it 'ユーザー登録リンクは表示しない' do
        expect(page).not_to have_link('新規登録', href: '/users/sign_up')
      end

      it '管理者登録リンクは表示しない' do
        expect(page).not_to have_link('新規登録', href: '/admin/sign_up')
      end

      it 'ユーザーログインリンクは表示しない' do
        expect(page).not_to have_link('ログイン', href: '/users/sign_in')
      end

      it '管理者ログインリンクは表示しない' do
        expect(page).not_to have_link('ログイン', href: '/admin/sign_in')
      end

      it 'ログアウトリンクを表示する' do
        expect(page).to have_content('ログアウト')
      end

      it '募集シフト一覧リンクを表示する' do
        expect(page).to have_link('募集シフト一覧', href: '/shifts')
      end

      it 'シフト作成リンクを表示しない' do
        expect(page).not_to have_link('シフト作成', href: '/shifts/new')
      end

      it 'ログアウトリンクが機能する' do
        click_button 'ログアウト'

        expect(page).to have_link('新規登録', href: '/users/sign_up')
        expect(page).to have_link('新規登録', href: '/admin/sign_up')
        expect(page).to have_link('ログイン', href: '/users/sign_in')
        expect(page).to have_link('ログイン', href: '/admin/sign_in')
        expect(page).not_to have_button('ログアウト')
      end
    end

    context '管理者ログインしている場合' do
      before do
        admin = create(:admin)
        sign_in admin
        visit '/'
      end

      it 'ユーザー登録リンクは表示しない' do
        expect(page).not_to have_link('新規登録', href: '/users/sign_up')
      end

      it '管理者登録リンクは表示しない' do
        expect(page).not_to have_link('新規登録', href: '/admin/sign_up')
      end

      it 'ユーザーログインリンクは表示しない' do
        expect(page).not_to have_link('ログイン', href: '/users/sign_in')
      end

      it '管理者ログインリンクは表示しない' do
        expect(page).not_to have_link('ログイン', href: '/admin/sign_in')
      end

      it 'ログアウトリンクを表示する' do
        expect(page).to have_content('ログアウト')
      end

      it 'シフト作成リンクを表示する' do
        expect(page).to have_link('シフト作成', href: '/shifts/new')
      end

      it '募集シフト一覧リンクを表示する' do
        expect(page).to have_link('募集シフト一覧', href: '/shifts')
      end

      it 'ログアウトリンクが機能する' do
        click_button 'ログアウト'

        expect(page).to have_link('新規登録', href: '/users/sign_up')
        expect(page).to have_link('新規登録', href: '/admin/sign_up')
        expect(page).to have_link('ログイン', href: '/users/sign_in')
        expect(page).to have_link('ログイン', href: '/admin/sign_in')
        expect(page).not_to have_button('ログアウト')
      end
    end
  end
end
