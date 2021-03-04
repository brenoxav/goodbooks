require 'rails_helper'

RSpec.describe 'Users >', type: :feature do
  let(:user) { User.new(username: 'brenoxav', full_name: 'Breno Xavier') }

  def sign_up(user)
    visit new_user_path
    fill_in 'Username', with: user.username
    fill_in 'Full name', with: user.full_name
    click_on 'Submit'
  end

  def log_in(user)
    visit login_path
    fill_in 'Username', with: user.username
    click_on 'Log in'
  end

  feature 'Create account >' do
    scenario 'Sign up with valid information' do
      sign_up(user)

      expect(page).to have_content('Account successfully created!')
    end
  end

  feature 'Sign in >' do
    scenario 'Sign in with valid credentials' do
      sign_up(user)
      click_on 'Log out'
      log_in(user)

      expect(page).to have_content('Logged in. Welcome!')
    end

    scenario 'Try to Sign in with invalid credentials' do
      visit login_path
      fill_in 'Username', with: 'b@d_h@ck3r'
      click_on 'Log in'

      expect(page).to have_content('Username not found! Want to create an account, instead?')
    end
  end
end
