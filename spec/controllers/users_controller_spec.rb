require 'spec_helper'

describe UsersController do

  let(:user) { FactoryGirl.create(:user) }
  subject { page }

  describe 'sign up' do
    context 'valid signup' do
      before do
        fill_in :Email, with: 'tomshacham'
        fill_in :Password, with: '12345678'
        fill_in :Password_confirmation, with: '12345678'
        click_button 'Sign up'
      end
      it { should have_css('notice') }
      it { should have_content 'Profile'}
    end
    context 'invalid sign up' do
      before do
        fill_in :Email, with: 'tomshacham'
        fill_in :Password, with: '12345678'
        fill_in :Password_confirmation, with: '12345678'
        click_button 'Sign up'
      end
      it { should have_css('alert') }
      it { should have_content 'invalid details'}
      it { should have_content 'Missions'}
    end
  end

  describe 'sign in' do
    context 'valid signin' do
      before {login_as user}
      it { should have_css('notice') }
      it { should have_content 'Profile'}
    end
    context 'invalid sign in' do
      before do
        fill_in :Email, with: 'tomshacham'
        fill_in :Password, with: '12345678'
        fill_in :Password_confirmation, with: '12345678'
        click_button 'Sign up'
      end
      it { should have_css('alert') }
      it { should have_content 'invalid details'}
      it { should have_content 'Missions'}
    end
  end

end
