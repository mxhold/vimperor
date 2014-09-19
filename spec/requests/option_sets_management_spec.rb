require 'rails_helper'

describe "OptionSet management" do
  describe "creation" do
    it "sends a file if successful" do
      post "/option_sets", option_set: { compatible: true }

      expect(response.status).to eql 201
      expect(response.header["Content-Disposition"]).to include "attachment"
    end

    it "responds with failure message if unsuccessful" do
      post "/option_sets", option_set: { compatible: nil }

      expect(response.status).to eql 422
      expect(request.flash[:error]).to be_present
      expect(response).to render_template(:new)
    end
  end
end
