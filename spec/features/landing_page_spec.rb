require 'rails_helper'

feature 'Landing page' do
  scenario 'User visits the landing page' do
    visit '/'

    expect(page).to have_text('Vimperor')
  end
end
