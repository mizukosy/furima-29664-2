require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it '9項目入力により登録される' do
        expect(@user).to be_valid
      end
      it 'password 6文字以上 && 英数字混合であれば登録される' do
        @user.password = '111aaa'
        @user.password_confirmation = '111aaa'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'nicknameがからでは登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it '既に同じメールアドレスで登録されている場合は、登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emaiには@がないと登録できない' do
        @user.email = '0000.gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください', 'パスワード英数字を含めて設定してください', 'パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'passwordが５文字以下では登録できない' do
        @user.password = 'aaa11'
        @user.password_confirmation = 'aaa11'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください', 'パスワード英数字を含めて設定してください')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード英数字を含めて設定してください')
      end
      it 'passwordが英語のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード英数字を含めて設定してください')
      end
      it 'passwordが入力されていてもpassword_confirmationが空ならば登録されない' do
        @user.password = 'aaa111'
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）英数字を含めて設定してください')
      end
      it '苗字が空では登録できない' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('名字を入力してください', '名字全角で入力して下さい')
      end
      it '名前が空では登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を入力してください', '名前全角で入力して下さい')
      end
      it '苗字が全角での入力であること' do
        @user.family_name = 'dummyﾀﾞﾐｰ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字全角で入力して下さい')
      end
      it '名前が全角で入力されていないと登録できない' do
        @user.first_name = 'dummyﾀﾞﾐｰ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前全角で入力して下さい')
      end
      it 'family_name_kanaがなければ登録できない' do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('名字のフリガナを入力してください', '名字のフリガナ全角カタカナで入力して下さい')
      end
      it 'first_name_kanaがなければ登録できない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('名前のフリガナを入力してください', '名前のフリガナ全角カタカナで入力して下さい')
      end
      it 'family_name_kanaが半角カタカナでは登録できない' do
        @user.family_name_kana = "ﾀﾞﾐｰ"
        @user.valid?
        expect(@user.errors.full_messages).to include('名字のフリガナ全角カタカナで入力して下さい')
      end
      it 'first_name_kanaが半角カタカナでは登録できない' do
        @user.first_name_kana = "ﾀﾞﾐｰ"
        @user.valid?
        expect(@user.errors.full_messages).to include('名前のフリガナ全角カタカナで入力して下さい')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('生年月日を入力してください')
      end
    end
  end
end
