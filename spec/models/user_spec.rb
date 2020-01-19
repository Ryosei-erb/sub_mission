require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user, name: "egipt", user_name: "egipt_cairo", email: "egipt@egipt.com")
    @other_user = FactoryBot.create(:user, name: "sweden", user_name: "sweden_stockholm", email: "sweden@sweden.com")
  end
  context "有効性と存在性のspec" do
    it "名前とユーザーネームがあれば有効になる" do
      expect(@user).to be_valid
    end
    it "名前がなければ無効になる" do
      @user.name = " "
      @user.valid?
      expect(@user.errors[:name]).to include("can't be blank")
    end
    it "ユーザーネームがなければ無効になる" do
      @user.user_name = " "
      @user.valid?
      expect(@user.errors[:user_name]).to include("can't be blank")
    end
    it "パスワードに空白を用いると無効になる" do
      @user.password  = " " * 6
      @user.valid?
      expect(@user.errors[:password]).to include("can't be blank")
    end
  end

  context "長さのspec" do
    it "名前の字数が51字以上であれば無効になる" do
      @user.name = "a" * 51
      @user.valid?
      expect(@user.errors[:name]).to include("is too long (maximum is 50 characters)")
    end
    it "ユーザーネームの字数が51字以上であれば無効になる" do
      @user.user_name = "a" * 51
      @user.valid?
      expect(@user.errors[:user_name]).to include("is too long (maximum is 50 characters)")
    end
    it "パスワードの字数が５字以下であれば無効になる" do
      @user.password = "a" * 5
      @user.valid?
      expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end

end
