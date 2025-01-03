require 'rails_helper'

RSpec.describe 'Shifts', type: :request do
  before do
    @admin = build(:admin)
    @user = create(:user)
    @shift = build(:shift)
  end

  describe 'GET /shifts/new' do
    context 'ログインしていない場合' do
      it 'HTTPステータス302を返す' do
        get '/shifts/new'
        expect(response).to have_http_status(302)
      end

      it '管理者ログインページにリダイレクトされる' do
        get '/shifts/new'
        expect(response).to redirect_to '/admin/sign_in'
      end
    end

    context '管理者ログインしている場合' do
      before { sign_in @admin }

      it 'HTTPステータス200を返す' do
        get '/shifts/new'
        expect(response).to have_http_status(200)
      end

      it '管理者ログインページにリダイレクトされない' do
        get '/shifts/new'
        expect(response).not_to redirect_to '/admin/sign_in'
      end
    end

    context 'ユーザーログインしている場合' do
      before { sign_in @user }

      it 'HTTPステータス302を返す' do
        get '/shifts/new'
        expect(response).to have_http_status(302)
      end

      it '管理者ログインページにリダイレクトされる' do
        get '/shifts/new'
        expect(response).to redirect_to '/admin/sign_in'
      end
    end
  end

  describe 'GET /shifts/:id' do
    context '管理者ログインしている場合' do
      it 'HTTPステータス200を返す' do
        sign_in @admin
        get "/shifts/#{@shift.id}"
        expect(response).to have_http_status(200)
      end
    end

    context 'ユーザーログインしている場合' do
      it 'HTTPステータス200を返す' do
        sign_in @user
        get "/shifts/#{@shift.id}"
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'GET /shifts' do
    context '管理者ログインしている場合' do
      it 'HTTPステータス200を返す' do
        sign_in @admin
        get "/shifts/#{@shift.id}"
        expect(response).to have_http_status(200)
      end
    end

    context 'ユーザーログインしている場合' do
      it 'HTTPステータス200を返す' do
        sign_in @user
        get "/shifts/#{@shift.id}"
        expect(response).to have_http_status(200)
      end
    end
  end
end
