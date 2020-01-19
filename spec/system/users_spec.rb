require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
    @user = FactoryBot.create(:user, name: "egipt", email: "egipt@egipt.com")
    @other_user = FactoryBot.create(:user, name: "sweden", email: "sweden@sweden.com")
  end

  describe "GET #show" do
    it "Profileページのリンクが正しく作動する" do
      visit user_path @user.id
      expect(page).to have_content "Home"
      click_link "Home"
      visit user_path @user.id
      expect(page).to have_content "Edit"
      click_link "Edit"
      expect(page).to have_content "Profile"
      click_link "Profile"
    end
  end

end
