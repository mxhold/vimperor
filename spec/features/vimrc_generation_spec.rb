require 'rails_helper'

feature 'vimrc generation' do
  scenario 'User can generate vimrc with all default settings', js: true do
    visit '/'

    click_on('Generate')

    expect(page).to have_content('set nocompatible')
    expect(page).to have_content('let mapleader=" "')
    expect(page).to have_content('set backspace=indent,eol,start')
    expect(page).to have_content('set expandtab')
    expect(page).to have_content('set tabstop=2')
    expect(page).to have_content('set shiftwidth=2')
    expect(page).to have_content('set list listchars=tab:»·,trail:·')
  end

  scenario 'User can generate vimrc with custom settings', js: true do
    visit '/'

    choose('option_set_compatible_true')
    click_on('Generate')

    expect(page).to have_content('set compatible')
  end

  scenario 'User can generate vimrc and then reload the page', js: true do
    visit '/'
    click_on('Generate')

    # find to wait for generation
    find('pre', text: 'set nocompatible')
    expect(page.current_path).to match(/[A-z0-9]+/)

    visit page.current_path

    expect(page).to have_content('set nocompatible')
  end

  scenario 'User can download generated vimrc', js: true do
    visit '/'
    click_on('Generate')

    click_on('Download')
    expect(page.response_headers['Content-Disposition']).to include 'attachment'
  end
end
