require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user, name: "egipt", email: "egipt@egipt.com")
    @other_user = FactoryBot.create(:user, name: "sweden", email: "sweden@sweden.com")
  end
  context "有効性と存在性のspec" do
    it "名前とメールアドレスがあれば有効になる" do
      expect(@user).to be_valid
    end
    it "名前がなければ無効になる" do
      @user.name = " "
      @user.valid?
      expect(@user.errors[:name]).to include("can't be blank")
    end
    it "メールアドレスがなければ無効になる" do
      @user.email = " "
      @user.valid?
      expect(@user.errors[:email]).to include("can't be blank")
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
    it "メールアドレスの字数が255字以上であれば無効になる" do
      @user.email = "a" * 244 + "@example.com"
      @user.valid?
      expect(@user.errors[:email]).to include("is too long (maximum is 255 characters)")
    end
    it "パスワードの字数が５字以下であれば無効になる" do
      @user.password = "a" * 5
      @user.valid?
      expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end
  context "書式のspec" do
    it "メールアドレスの書式が有効である" do
      valid_addresses =  %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
    it "メールアドレスの書式が無効である" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.valid?
        expect(@user.errors[:email]).to include("is invalid")
      end
    end
  end
  context "一意性のspec" do
    it "メールアドレスが同じユーザーは認められない" do
      dup_user = @user.dup
      dup_user.email = @user.email.upcase
      expect(dup_user).to be_invalid
    end
  end

end
