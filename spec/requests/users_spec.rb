require 'rails_helper'

RSpec.describe "Users", type: :request do
  before do
    @user = FactoryBot.create(:user, name: "egipt", email: "egipt@egipt.com")
    @other_user = FactoryBot.create(:user, name: "sweden", email: "sweden@sweden.com")
  end
  describe "GET #show" do
    it "リクエストが成功する" do
      get user_path @user.id
      expect(response).to be_successful
    end
    it "200レスポンスを返す" do
      get user_path @user.id
      expect(response).to have_http_status "200"
    end
    it "ユーザー名が表示される" do
      get user_path @user.id
      expect(response.body).to include(@user.name)
    end
  end
  describe "GET #new" do
    it "リクエストが成功する" do
      get signup_path
      expect(response).to be_successful
    end
    it "200レスポンスを返す" do
      get signup_path
      expect(response.status).to eq 200
    end
    it "signupテンプレートを表示する" do
      get signup_path
      expect(response.body).to include "Create my account"
    end
  end
  describe "POST #create" do
    context "パラメータが不正な場合" do
      it "ユーザーは登録されない" do
        user_params = FactoryBot.attributes_for(:user, :invalid)
        expect {
          post users_path, params: { user: user_params }
        }.to change{ User.count }.by(0)
      end
      it "form画面に戻る" do
        user_params = FactoryBot.attributes_for(:user, :invalid)
        post users_path, params: { user: user_params}
        expect(response).to render_template("users/new")
      end
    end
    context "パラメータが正しい場合" do
      it "ユーザーが登録される" do
        user_params = FactoryBot.attributes_for(:user, name: "usa", email: "usa@usa.com", password:"password", password_confirmation: "password")
        expect {
          post users_path, params: { user: user_params}
        }.to change{ User.count }.by(1)
      end
      it "リダイレクトする" do
        user_params = FactoryBot.attributes_for(:user, name: "usa", email: "usa@usa.com", password:"password", password_confirmation: "password")
        post users_path, params: { user: user_params}
        expect(response).to redirect_to User.last
      end
    end
  end
end
