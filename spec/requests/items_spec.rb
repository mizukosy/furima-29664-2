require 'rails_helper'

describe ItemsController, type: :request do
  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      get root_path
    end
    it 'newアクションにリクエストすると正常にレスポンスが返ってくる' do
    end
    it 'newアクションにリクエストすると出品フォームが存在する' do
    end
    it 'createアクションにリクエストするとトップページへ遷移する' do
      @item = FactoryBot.create(:item)
    end
  end
end
