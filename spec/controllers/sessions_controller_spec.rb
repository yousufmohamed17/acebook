require 'rails_helper'
require 'helper_methods'

RSpec.describe SessionsController, type: :controller do
  describe 'GET /login ' do
    it 'should be able to visit login route' do
      get :new
      expect(response).to have_http_status(200)
    end

    it 'successfully loged in - redirected to post overview route ' do
      add_new_sample_user
      post :create,
           params: {
             email: 'hilly@example.com',
             password: 'griltheAnim4lz'
           }
      expect(response).to redirect_to(posts_url)
    end

    it 'responds 200 when login details are wrong' do
      post :create, params: { email: '', password: '' }
      expect(response).to have_http_status(302)
    end

    it 'alerts user if wrong password or email given' do
      post :create, params: { email: '', password: '' }
      expect(flash[:invalid]).to match('Invalid email or password')
    end

    it 'reidrects to login invalid login' do
      post :create, params: { email: '', password: '' }
      expect(response).to redirect_to(login_path)
    end
  end

  describe 'DELETE / logout' do
    it 'logs out and redirects to login' do
      add_new_sample_user
      session[:user_id] = User.last.id
      delete :destroy
      expect(response).to redirect_to(login_path)
    end

    it 'doesnt store sessions' do
      add_new_sample_user
      session[:user_id] = User.last.id
      delete :destroy
      expect(session[:user_id]).to be_nil
    end
  end
end
