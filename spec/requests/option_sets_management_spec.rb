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
        post "/option_sets", format: :js, option_set: { compatible: nil }
      }.not_to change { OptionSet.count }

      expect(response.status).to eql 422
      expect(response.body).to include "error occurred"
    end
  end
end
