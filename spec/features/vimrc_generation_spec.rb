require 'rails_helper'

feature 'vimrc generation' do
  scenario 'User uses defaults' do
    visit '/'

    click_on('Generate')

    expect(page.response_headers["Content-Disposition"]).to include "attachment"
    expect(page.source).to eql "set nocompatible\n"
  end
end
