require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before do
    @user = FactoryBot.create(:user)
  end
  describe 'GET /users' do
    it 'newアクションをリクエストすると正常にレスポンスが返ってくる' do
      get new_user_registration_path
      expect(response.status).to eq 200
    end
    it 'newアクションにリクエストするとレスポンスに登録フォームが存在する' do
      get new_user_registration_path
      expect(response.body).to include ''
    end
  end
end
