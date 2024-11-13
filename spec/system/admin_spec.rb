require 'rails_helper'

RSpec.describe 'Admin', type: :system do
  before do
    driven_by(:rack_test)
  end

  # ユーザー情報入力用の変数
  let(:email) { 'test@example.com' }
  let(:password) { 'password' }
  let(:password_confirmation) { password }

  describe 'ユーザー登録機能の検証' do
    before { visit '/admin/sign_up' }

    # ユーザー登録を行う一連の操作をまとめる
    subject do
      fill_in 'admin_email', with: email
      fill_in 'admin_password', with: password
      fill_in 'admin_password_confirmation', with: password_confirmation
      click_button '管理者登録'
    end

    context '正常系' do
      it 'ユーザーを作成できる' do
        expect { subject }.to change(Admin, :count).by(1)
        expect(current_path).to eq('/')
      end
    end

    context '異常系' do
      context 'emailが空の場合' do
        let(:email) { '' }
        it 'ユーザーを作成せず、エラーメッセージを表示する' do
          expect { subject }.not_to change(Admin, :count)
          expect(page).to have_content('メールアドレス が入力されていません。')
        end
      end

      context 'passwordが空の場合' do
        let(:password) { '' }
        it 'ユーザーを作成せず、エラーメッセージを表示する' do
          expect { subject }.not_to change(Admin, :count)
          expect(page).to have_content('パスワード が入力されていません。')
        end
      end

      context 'passwordが6文字未満の場合' do
        let(:password) { 'a' * 5 }
        it 'ユーザーを作成せず、エラーメッセージを表示する' do
          expect { subject }.not_to change(Admin, :count)
          expect(page).to have_content('パスワード は6文字以上に設定して下さい。')
        end
      end

      context 'passwordとpassword_confirmationが一致しない場合' do
        let(:password_confirmation) { "#{password}hoge" }
        it 'ユーザーを作成せず、エラーメッセージを表示する' do
          expect { subject }.not_to change(Admin, :count)
          expect(page).to have_content('確認用パスワード が一致していません。')
        end
      end
    end
  end

  # describe 'ログイン機能の検証' do
  #   # 事前にユーザー作成
  #   before do
  #     create(:user, firstname: firstname, lastname: lastname, email: email, password: password, password_confirmation: password)

  #     visit '/users/sign_in'
  #     fill_in 'user_email', with: email
  #     fill_in 'user_password', with: 'password'
  #     click_button 'ログイン'
  #   end

  #   context '正常系' do
  #     it 'ログインに成功し、トップページにリダイレクトする' do
  #       expect(current_path).to eq('/')
  #     end

  #     it 'ログイン成功時のフラッシュメッセージを表示する' do
  #       expect(page).to have_content('ログインしました。')
  #     end
  #   end

  #   context '異常系' do
  #     let(:password) { 'NGpassword' }
  #     it 'ログインに失敗し、ページ遷移しない' do
  #       expect(current_path).to eq('/users/sign_in')
  #     end

  #     it 'ログイン失敗時のフラッシュメッセージを表示する' do
  #       expect(page).to have_content('メールアドレスまたはパスワードが違います。')
  #     end
  #   end
  # end
end
