require 'rails_helper'

feature 'vimrc generation' do
  scenario 'User can generate vimrc with all default settings', js: true do
    visit '/'

    expect(find('.output-panel', visible: false)).not_to be_visible

    click_on('Generate')

    expect(find('.output-panel')).to be_visible

    expect(page).to have_content('set nocompatible')
  end

  scenario 'User can generate vimrc with custom settings', js: true do
    visit '/'

    choose('On')
    click_on('Generate')

    expect(page).to have_content('set compatible')
  end

  scenario 'User can generate vimrc and then reload the page', js: true do
    visit '/'
    click_on('Generate')

    # find to wait for generation
    find('samp', text: 'set nocompatible')
    expect(page.current_path).to match(/[A-z0-9]+/)

    visit page.current_path

    expect(page).to have_content('set nocompatible')
  end
end
