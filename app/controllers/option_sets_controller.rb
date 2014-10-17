class OptionSetsController < ApplicationController
  respond_to :js, :html

  before_action :decode_hashid
  before_action :set_option_set, only: [:show, :download]

  def new
    @option_set = OptionSet.new
  end

  def create
    @option_set = OptionSet.create(option_set_params)
    respond_with(@option_set)
  end

  def show
    @new_option_set = OptionSet.new
  end

  def download
    send_data(
      OptionSetPresenter.new(@option_set).render,
      filename: 'vimrc.txt',
      type: 'text/plain'
    )
  end

  private

  def set_option_set
    @option_set = OptionSet.find(params[:id])
  end

  def decode_hashid
    params[:id] = Hashid.decode(params[:hashid]) unless params[:hashid].blank?
  end

  def option_set_params
    params.fetch(:option_set, {}).permit(
      OptionSet.valid_options,
    ).merge(
      creator_ip: request.remote_ip
    )
  end
end
