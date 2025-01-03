require 'rails_helper'

RSpec.describe User, type: :model do
  let(:firstname) { '山田' }
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
        context '文字数が5文字以下の場合' do
          let(:firstname) { 'あいうえお' } # 5文字
          let(:lastname) { 'あいうえお' } # 5文字

          it 'Userオブジェクトは有効である' do
            expect(user.valid?).to be(true)
          end
        end

        context '文字数が5文字を超える場合' do
          let(:firstname) { 'あいうえおか' } # 6文字
          let(:lastname) { 'あいうえおか' } # 6文字

          it 'Userオブジェクトは無効である' do
            user.valid?

            expect(user.valid?).to be(false)
            expect(user.errors[:firstname]).to include('は5文字以下に設定して下さい。')
            expect(user.errors[:lastname]).to include('は5文字以下に設定して下さい。')
          end
        end
      end

      describe '存在性の検証' do
        context 'firstname,lastnameが空欄の場合' do
          let(:firstname) { '' }
          let(:lastname) { '' }

          it 'Userオブジェクトは無効である' do
            expect(user.valid?).to be(false)
            expect(user.errors[:firstname]).to include('が入力されていません。')
            expect(user.errors[:lastname]).to include('が入力されていません。')
          end
        end
      end
    end
  end
end
