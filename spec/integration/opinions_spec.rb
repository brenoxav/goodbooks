require 'rails_helper'

RSpec.describe 'Opinions >', type: :feature do
  let(:user) { User.new(username: 'brenoxav', full_name: 'Breno Xavier') }
  let(:opinion) do
    Opinion.new(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,
              sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
  end

  # Auxiliary methods definitions
  def sign_up(user)
    visit new_user_path
    fill_in 'Username', with: user.username
    fill_in 'Full name', with: user.full_name
    click_on 'Submit'
  end

  # Tests
  feature 'Post Opinion' do
    scenario 'Create a new opinion from the home page' do
      visit new_user_path
      sign_up(user)
      visit opinions_path
      fill_in 'opinion_text', with: opinion.text
      click_on 'Share opinion'

      expect(page).to have_content('Opinion successfully posted!')
    end
  end

  scenario 'Try to create a new opinion from the home page with invalid input' do
    visit new_user_path
    sign_up(user)
    visit opinions_path
    fill_in 'opinion_text', with: nil
    click_on 'Share opinion'

    expect(page).not_to have_content('Opinion successfully posted!')
  end
end
