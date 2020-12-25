require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
   
    it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it " nicknameがない場合は登録できないこと" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailがない場合は登録できないこと" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordがない場合は登録できないこと" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      @user. password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "emailに@とドメインがない場合は登録できないこと " do
      @user.email = "knfndjaja"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "重複したemailが存在する場合は登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it " passwordが5文字以下であれば登録できないこと " do
      @user.password = "as566"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが半角英字のみの場合登録できないこと" do
      @user.password = "asjjdb"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordが半角数字のみの場合登録できないこと" do
      @user.password = "asjjdb"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "password全角英数字の場合登録できないこと" do
      @user.password = "１j１j1j１j"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "first_nameがない場合は登録できないこと" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "family_nameがない場合は登録できないこと" do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    

    it "first_name_kanaがない場合は登録できないこと" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "family_name_kanaがない場合は登録できないこと" do
      @user.family_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it "birth_dayがない場合は登録できないこと" do
      @user.birth_day = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end

    it "first_nameが全角でない場合は登録できないこと" do
      @user.first_name = "kaka"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "family_nameが全角でない場合は登録できないこと" do
      @user.family_name = "kaka"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end

    it "first_name_kanaが全角でない場合は登録できないこと" do
      @user.first_name_kana = "kaka"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it "first_name_kanaがカタカナでない場合は登録できないこと" do
      @user.first_name_kana = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    
    it "family_name_kanaが全角でない場合は登録できないこと" do
      @user.family_name_kana = "kaka"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end

    it "family_name_kanaがカタカナでない場合は登録できないこと" do
      @user.family_name_kana = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
  end
end
