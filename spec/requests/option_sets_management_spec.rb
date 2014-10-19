require 'rails_helper'

describe 'OptionSet management' do
  describe 'creation' do
    it 'creates an option set given valid settings' do
      expect {
        post '/option_sets', format: :js, option_set: { compatible: true }
      }.to change { OptionSet.count }.by(1)

      expect(response.status).to eql 200
    end
  end
  describe 'show' do
    it 'renders the option set' do
      option_set = create(:option_set)
      get "/#{option_set.to_param}"

      expect(response.status).to eql 200
    end
  end
  describe 'download' do
    it 'sends a text file' do
      option_set = create(:option_set)
      get "/#{option_set.to_param}/download"

      expect(response.status).to eql 200
      expect(response.headers['Content-Disposition']).to include 'attachment'
      expect(response.headers['Content-Type']).to eql 'text/plain'
    end
  end
end
