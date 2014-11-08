require 'rails_helper'

describe OptionSetsController do
  describe 'before callbacks' do
    it 'sets the id in the params to the decoded hashid' do
      expect(Hashid).to receive(:decode).with('abc123').and_return '123'
      allow(OptionSet).to receive(:find).and_return(OptionSet.new(options: {}))
      get :show, hashid: 'abc123'
      expect(controller.params[:id]).to eql '123'
    end
  end
  describe 'create' do
    it 'creates the option set with the creator\'s ip address' do
      expect {
        post :create, option_set: { compatible: true }, format: :js
      }.to change(OptionSet, :count).by(1)
      expect(OptionSet.last.creator_ip).not_to be_nil
    end
  end
end
