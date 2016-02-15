require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  before do
    @user = create_user
    @secret1 = @user.secrets.create(user:@user, content:'Oops')
  end
  describe 'when not logged in' do
    it 'user can not add like' do
      session[:user_id] = nil
      post :create
      expect(response).to redirect_to('/sessions/new')
    end
  end
end
