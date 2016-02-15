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
  describe 'when signed in as the wrong user' do
    it "will not let you destroy someone else's like" do
      @wrong_user = create_user
      session[:user_id] = @wrong_user
      delete :destroy
      expect(response).to redirect_to('/sessions/new')
    end
  end
end
