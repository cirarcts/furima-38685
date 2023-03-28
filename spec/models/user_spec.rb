require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'できる場合（正常系）' do
      it '必要な情報（nickname,email,password,password_confirmation,last_name,first_name,last_name_ruby,first_name_ruby,date_of_birth）が全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'できない場合（異常系）' do
      it 'nicknameが空の場合は登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空の場合は登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '同じemailがすでに存在する場合は登録できない' do
        @user.save
        equal_user = FactoryBot.build(:user)
        equal_user.email = @user.email
        equal_user.valid?
        expect(equal_user.errors.full_messages).to include "Email has already been taken"
      end
      it 'emailは@を含まなければ登録できない' do
        @user.email = 'testaddress'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'passwordが空の場合は登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordは6文字以上でなければ登録できない' do
        @user.password = 'a1'
        @user.password_confirmation = 'a1'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordに全角文字を含む場合は登録できない' do
        @user.password = 'abあい12'
        @user.password_confirmation = 'abあい12'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordとpassword_confirmationが不一致の場合は登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'def456'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'last_nameが空の場合は登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'last_nameは全角（漢字・平仮名・カタカナ）のいずれかを含まなければ登録できない' do
        @user.last_name = 'abc123'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end
      it 'first_nameが空の場合は登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'first_nameは全角（漢字・平仮名・カタカナ）のいずれかを含まなければ登録できない' do
        @user.first_name = 'abc123'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it 'last_name_rubyが空の場合は登録できない' do
        @user.last_name_ruby = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name ruby can't be blank"
      end
      it 'last_name_rubyは全角カタカナでなければ登録できない' do
        @user.last_name_ruby = 'oおワ田'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name ruby is invalid"
      end
      it 'first_name_rubyが空の場合は登録できない' do
        @user.first_name_ruby = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name ruby can't be blank"
      end
      it 'first_name_rubyは全角カタカナでなければ登録できない' do
        @user.first_name_ruby = 'oおワ田'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name ruby is invalid"
      end
      it 'date_of_birthが空の場合は登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Date of birth can't be blank"
      end
    end
  end
end
