# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

# rubocop:disable Metrics/BlockLength
RSpec.describe '/admin/users', type: :request do
  before do
    @admin_user = FactoryBot.create(:admin_user)
    allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return({ admin_user_id: @admin_user.id })
  end

  # Admin::User. As you add validations to Admin::User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      login_name: 'user',
      password: 'passw0rd'
    }
  end

  let(:invalid_attributes) do
    {
      login_name: Faker::Internet.user_name,
      password: 'pass'
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      User.create! valid_attributes
      get admin_users_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      user = User.create! valid_attributes
      get admin_user_url(user)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_admin_user_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      user = User.create! valid_attributes
      get edit_admin_user_url(user)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new User' do
        expect do
          post admin_users_url, params: { user: valid_attributes }
        end.to change(User, :count).by(1)
      end

      it 'redirects to the created admin_user' do
        post admin_users_url, params: { user: valid_attributes }
        user = User.last
        expect(response).to redirect_to(admin_user_url(user))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new User' do
        expect do
          post admin_users_url, params: { user: invalid_attributes }
        end.to change(User, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post admin_users_url, params: { user: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          login_name: 'user1',
          password: 'passw0rd'
        }
      end

      it 'updates the requested user' do
        user = User.create! valid_attributes
        patch admin_user_url(user), params: { user: new_attributes }
        user.reload
        expect(user.login_name).to eq 'user1'
      end

      it 'redirects to the user' do
        user = User.create! valid_attributes
        patch admin_user_url(user), params: { user: new_attributes }
        user.reload
        expect(response).to redirect_to(admin_user_url(user))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        user = User.create! valid_attributes
        patch admin_user_url(user), params: { user: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested admin_user' do
      user = User.create! valid_attributes
      expect do
        delete admin_user_url(user)
      end.to change(User, :count).by(-1)
    end

    it 'redirects to the admin_users list' do
      user = User.create! valid_attributes
      delete admin_user_url(user)
      expect(response).to redirect_to(admin_users_url)
    end
  end
end
# rubocop:enable Metrics/BlockLength
