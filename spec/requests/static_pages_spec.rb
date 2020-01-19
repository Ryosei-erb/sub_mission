require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET #home" do
    it "レスポンスが成功する" do
      get root_url
      expect(response).to be_successful
    end
    it "200レスポンスを返す" do
      get root_url
      expect(response).to have_http_status "200"
    end
    it "ホームページの内容が表示される" do
      get root_url
      expect(response.body).to include "This is a top page."
    end
  end
  describe "GET #help" do
    it "レスポンスが成功する" do
      get help_path
      expect(response).to be_successful
    end
    it "200レスポンスを返す" do
      get help_path
      expect(response).to have_http_status "200"
    end
    it "利用規約ページの内容が表示される" do
      get help_path
      expect(response.body).to include "This is a help page."
    end
  end
end
