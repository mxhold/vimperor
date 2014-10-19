class OptionSetsController < ApplicationController
  respond_to :js, :html

  before_action :decode_hashid
  before_action :set_option_set, only: [:show, :download]

  def new
    @option_set_form = OptionSetForm.new
  end

  def create
    option_set_form = OptionSetForm.new(option_set_params)
    @option_set = option_set_form.submit
    respond_with(@option_set)
  end

  def show
    @option_set_form = OptionSetForm.new
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
      OptionSetForm.valid_options,
    ).merge(
      creator_ip: request.remote_ip
    )
  end
end
