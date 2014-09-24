require 'rails_helper'

describe OptionSetsController do
  describe 'before callbacks' do
    it 'sets the id in the params to the decoded hashid' do
      expect(Hashid).to receive(:decode).with('abc123').and_return '123'
      allow(OptionSet).to receive(:find)
      get :show, hashid: 'abc123'
      expect(controller.params[:id]).to eql "123"
    end
  end
end
