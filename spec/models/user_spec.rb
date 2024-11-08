require 'rails_helper'

RSpec.describe User, type: :model do
  let(:firstname) { 'テスト' }
  let(:lastname) { '太郎' }
  let(:email) { 'test@example.com' }
  let(:user) { build(:user, firstname: firstname, lastname: lastname, email: email) }

  describe '.first' do
    subject { user }

    it '事前に作成した通りのUserを返す' do
      expect(subject.firstname).to eq(firstname)
      expect(subject.lastname).to eq(lastname)
      expect(subject.email).to eq(email)
    end
  end

  describe 'validation' do
    describe 'firstname,lastname属性' do
      describe '文字数制限の検証' do
        context '文字数が10文字以下の場合' do
          let(:firstname) { 'あいうえおかきくけこ' } #10文字
          let(:lastname) { 'あいうえおかきくけこ' } #10文字
          
          it 'Userオブジェクトは有効である' do
            expect(user.valid?).to be(true)
          end
        end

        context '文字数が10文字を超える場合' do
          let(:firstname) { 'あいうえおかきくけこさ' } #11文字
          let(:lastname) { 'あいうえおかきくけこさ' } #11文字

          it 'Userオブジェクトは無効である' do
            user.valid?

            expect(user.valid?).to be(false)
            expect(user.errors[:firstname]).to include('is too long (maximum is 10 characters)')
            expect(user.errors[:lastname]).to include('is too long (maximum is 10 characters)')
          end
        end
      end

      describe '存在性の検証' do
        context 'firstname,lastnameが空欄の場合' do
          let(:firstname) { '' }
          let(:lastname) { '' }

          it 'Userオブジェクトは無効である' do
            expect(user.valid?).to be(false)
            expect(user.errors[:firstname]).to include("can't be blank")
            expect(user.errors[:lastname]).to include("can't be blank")
          end
        end
      end
    end
  end
end
