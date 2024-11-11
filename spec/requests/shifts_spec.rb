require 'rails_helper'

RSpec.describe 'Shifts', type: :request do
  before do
    @user = create(:user)
    @shift = create(:shift)
  end

  describe 'GET /shifts/new' do
    context 'ログインしていない場合' do
      it 'HTTPステータス302を返す' do
        get '/shifts/new'
        expect(response).to have_http_status(302)
      end

      it 'ログインページにリダイレクトされる' do
        get '/shifts/new'
        expect(response).to redirect_to '/users/sign_in'
      end
    end

    context 'ログインしている場合' do
      before { sign_in @user }

      it 'HTTPステータス200を返す' do
        get '/shifts/new'
        expect(response).to have_http_status(200)
      end

      it 'ログインページにリダイレクトされない' do
        get '/shifts/new'
        expect(response).not_to redirect_to '/users/sign_in'
      end
    end
  end

  describe 'GET /shifts/:id' do
    context 'ログインしていない場合' do
      it 'HTTPステータス302を返す' do
        get "/shifts/#{@shift.id}"
        expect(response).to have_http_status(302)
      end
    end

    context 'ログインしている場合' do
      it 'HTTPステータス200を返す' do
        sign_in @user
        get "/shifts/#{@shift.id}"
        expect(response).to have_http_status(200)
      end
    end
  end
end
