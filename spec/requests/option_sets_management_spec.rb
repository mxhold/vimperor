require 'rails_helper'

describe "OptionSet management" do
  describe "creation" do
    it "creates an option set given valid settings" do
      expect {
        post "/option_sets", format: :js, option_set: { compatible: true }
      }.to change { OptionSet.count }.by(1)

      expect(response.status).to eql 201
      expect(response.location).to eql option_sets_path
    end

    it 'responds with errors given invalid settings' do
      expect {
        post "/option_sets", format: :js, option_set: { foo: nil }
      }.not_to change { OptionSet.count }

      expect(response.status).to eql 422
      expect(response.body).to include "error occurred"
    end
  end
  describe 'show' do
    it 'renders the option set' do
      option_set = create(:option_set)
      get "/#{option_set.to_param}"

      expect(response.status).to eql 200
    end
  end
end
