require 'rails_helper'

feature 'vimrc generation' do
  scenario 'User generates vimrc with all default settings', js: true do
    visit '/'

    expect(find('.output-panel', visible: false)).not_to be_visible

    click_on('Generate')

    expect(find('.output-panel')).to be_visible

    expect(page).to have_content('set nocompatible')
  end

  scenario 'User generates vimrc with custom settings', js: true do
    visit '/'

    choose('On')
    click_on('Generate')

    expect(page).to have_content('set compatible')
  end
end
