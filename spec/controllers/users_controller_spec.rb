require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do

    # 事前にnewアクションにgetし、
    # これによりgetのリクエスト結果が、responseという変数に格納される

    before { get :new}

    it 'レスポンスコードが200であること' do
      expect(response).to have_http_status(:ok)
    end

    it 'newテンプレートをレンダリングすること' do
      # render_templateは、'rails-controller-testing'のgemを導入して使えるようになる
      expect(response).to render_template(:new)
    end

    it '新しいuserオブジェクトがビューに渡されること' do
      # viewに渡される変数のチェック
      expect(assigns(:user)).to be_a_new User
    end

  end
end
